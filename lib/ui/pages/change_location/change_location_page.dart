import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_for_job/common/config/extensions.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/common/services/implements/geocoder_implement.dart';
import 'package:task_for_job/ui/pages/change_location/bloc/map_bloc.dart';
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
    _getLocationPermissionAndMove();
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
    final controller = await _controller.future;
    final position = await Geolocator.getCurrentPosition();
    _bloc.add(const MapEvent.scrollStarted());
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position.toPoint()),
      ),
      animation: const MapAnimation(duration: 3),
    );
    _bloc.add(MapEvent.changeByMap(position.toPoint()));
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
                Expanded(
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 0.5,
                    heightFactor: 0.8,
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      label: const Text(
                        "Ortga qaytish",
                        style: TextStyle(fontSize: 14),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.zero,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: MapWidget(
                    onMapCreated: _onMapCreated,
                    getLocation: _getLocation,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        minimumSize: const Size.fromHeight(60),
                        maximumSize: const Size.fromHeight(60),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Tasdiqlash",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
