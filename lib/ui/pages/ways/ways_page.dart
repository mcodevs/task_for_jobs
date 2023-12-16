import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_elevated_button.dart';
import 'package:task_for_job/ui/pages/ways/bloc/ways_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class WaysPage extends StatefulWidget {
  const WaysPage({super.key});

  @override
  State<WaysPage> createState() => _WaysPageState();
}

class _WaysPageState extends State<WaysPage> {
  late final WaysBloc _bloc;
  final Completer<YandexMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _bloc = WaysBloc(context)..add(const WaysEvent.getDirections());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WaysBloc>.value(
      value: _bloc,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            BlocConsumer<WaysBloc, WaysState>(
              listener: (context, state) {
                state.map(
                  initial: (value) {},
                  loading: (value) async {
                    final first =
                        (value.objects.first as PlacemarkMapObject).point;
                    final second =
                        (value.objects.last as PlacemarkMapObject).point;
                    final controller = await _controller.future;
                    await controller.moveCamera(
                      CameraUpdate.newBounds(
                        BoundingBox(
                          northEast: first,
                          southWest: second,
                        ),
                      ),
                      animation: const MapAnimation(),
                    );
                    await controller.moveCamera(
                      CameraUpdate.zoomOut(),
                      animation: const MapAnimation(),
                    );
                  },
                  success: (value) {},
                  error: (value) {},
                );
              },
              builder: (context, state) {
                return YandexMap(
                  mapObjects: state.maybeMap(
                    orElse: () => [],
                    loading: (value) {
                      return value.objects;
                    },
                    success: (value) => value.objects,
                  ),
                  onMapCreated: (controller) =>
                      _controller.complete(controller),
                );
              },
            ),
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: BlocBuilder<WaysBloc, WaysState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    childText: state.map(
                      initial: (value) => "Yo'nalish aniqlanmoqda...",
                      loading: (value) => "Mavjud yo'llar qidirilmoqda...",
                      success: (value) => "Kettik",
                      error: (value) => "Xatolik mavjud. Qayta urining!",
                    ),
                    onPressed: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
