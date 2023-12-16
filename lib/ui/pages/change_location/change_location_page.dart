import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_for_job/common/config/extensions.dart';
import 'package:task_for_job/common/services/implements/geocoder_implement.dart';
import 'package:task_for_job/ui/functions/snackbar.dart';
import 'package:task_for_job/ui/pages/change_location/bloc/map_bloc.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_back_button.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_elevated_button.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ChangeLocationPage extends StatefulWidget {
  const ChangeLocationPage({super.key});

  @override
  State<ChangeLocationPage> createState() => _ChangeLocationPageState();
}

class _ChangeLocationPageState extends State<ChangeLocationPage> {
  final Completer<YandexMapController> _controller = Completer();
  final ValueNotifier<bool> isScrolled = ValueNotifier(false);
  late final MapBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MapBloc(repository: GeocoderImpl());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _getLocationPermissionAndMove();
    });
  }

  Future<void> _getLocationPermissionAndMove() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await _getLocation();
    }
  }

  Future<void> _getLocation() async {
    try {
      final controller = await _controller.future;
      final position = (await Geolocator.getLastKnownPosition()) ??
          await Geolocator.getCurrentPosition();
      await controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position.toPoint()),
        ),
        animation: const MapAnimation(duration: 3),
      );
    } on LocationServiceDisabledException {
      if (mounted) {
        showSnackBar(
          context: context,
          text: "GPS service is disabled",
        );
      }
    }
  }

  void _onMapCreated(YandexMapController controller) =>
      _controller.complete(controller);

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: CustomBackButton(),
                ),
                Expanded(
                  flex: 9,
                  child: MapWidget(
                    onMapCreated: _onMapCreated,
                    getLocation: _getLocation,
                  ),
                ),
                CustomElevatedButton(
                  childText: "Tasdiqlash",
                  onPressed: () {
                    MapState state = _bloc.state;
                    state.maybeMap(
                      orElse: () {},
                      success: (value) => Navigator.pop(context, value.address),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
