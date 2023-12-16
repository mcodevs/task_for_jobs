import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/ui/pages/change_location/bloc/map_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.onMapCreated,
    required this.getLocation,
  });

  final void Function(YandexMapController)? onMapCreated;
  final Future<void> Function() getLocation;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.zero,
          topRight: Radius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: YandexMap(
                logoAlignment: const MapAlignment(
                  horizontal: HorizontalAlignment.left,
                  vertical: VerticalAlignment.bottom,
                ),
                onMapCreated: widget.onMapCreated,
                tiltGesturesEnabled: false,
                onCameraPositionChanged: (cameraPosition, reason, finished) {
                  if (finished) {
                    context.read<MapBloc>().add(
                          MapEvent.changeByMap(cameraPosition.target),
                        );
                  } else {
                    context.read<MapBloc>().add(const MapEvent.scrollStarted());
                  }
                },
              ),
            ),
            BlocBuilder<MapBloc, MapState>(
              builder: (context, state) => state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                hasScroll: (value) => ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Colors.black26,
                        Colors.black26,
                      ],
                    ).createShader(bounds);
                  },
                  child: const SizedBox.expand(
                    child: ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              height: 80,
              right: 0,
              left: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        final arguments = (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};
                        return TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            labelText: arguments['title'] ?? "Qayerdan:",
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: BlocConsumer<MapBloc, MapState>(
                listener: (context, state) {
                  state.map(
                    hasScroll: (value) => _controller.text = "Manzilni tanlang",
                    loading: (value) => _controller.text = "Qidirilmoqda...",
                    success: (value) =>
                        _controller.text = value.address.address,
                    error: (value) =>
                        _controller.text = "Xatolik yuz berdi. Qayta urining!",
                  );
                },
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 5,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        transform: Matrix4.translationValues(
                            0,
                            state.maybeMap(
                              orElse: () => -20,
                              hasScroll: (value) => -40,
                            ),
                            0),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              state.maybeMap(
                                orElse: () => 10,
                                hasScroll: (value) => 30,
                              ),
                            ),
                          ),
                          color: AppColors.primary,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 9,
                              spreadRadius: state.maybeMap(
                                orElse: () => -13,
                                hasScroll: (value) => -15,
                              ),
                              offset: const Offset(0, 45),
                            )
                          ],
                        ),
                        transform: Matrix4.translationValues(
                          0,
                          state.maybeMap(
                            orElse: () => -50,
                            hasScroll: (value) => -60,
                          ),
                          0,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: state.map(
                            hasScroll: (value) => const Icon(Icons.more_horiz),
                            loading: (value) => const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            ),
                            success: (value) => const Icon(Icons.check),
                            error: (value) => const Icon(Icons.error_outline),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FloatingActionButton.small(
                  shape: const CircleBorder(),
                  onPressed: widget.getLocation,
                  backgroundColor: AppColors.white,
                  child: const Icon(
                    Icons.gps_fixed,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
