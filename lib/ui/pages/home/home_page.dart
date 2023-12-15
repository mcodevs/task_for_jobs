import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_for_job/common/config/extensions.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/ui/pages/home/bloc/map_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final Completer<YandexMapController> _controller = Completer();
  final ValueNotifier<bool> isScrolled = ValueNotifier(false);
  late final MapBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MapBloc();
    getLocation();
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
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
  }

  void _onMapCreated(YandexMapController controller) {
    _controller.complete(controller);
    controller.toggleUserLayer(visible: true);
  }

  // Future<String> _getAddress(Point point) async {
  //   // Use the Yandex Geocoder API to get the address of the point
  //   // Replace the API key with your own
  //   final url =
  //       'https://geocode-maps.yandex.ru/1.x/?apikey=<YOUR_API_KEY>&format=json&geocode=${point.longitude},${point.latitude}';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     // Get the first result from the response
  //     final result = data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject'];
  //     // Get the formatted address from the result
  //     final address = result['metaDataProperty']['GeocoderMetaData']['text'];
  //     return address;
  //   } else {
  //     return 'Unknown address';
  //   }
  // }

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
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Text("data"),
              ),
              Expanded(
                flex: 5,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        YandexMap(
                          logoAlignment: const MapAlignment(
                            horizontal: HorizontalAlignment.left,
                            vertical: VerticalAlignment.bottom,
                          ),
                          onMapCreated: _onMapCreated,
                          tiltGesturesEnabled: false,
                          onCameraPositionChanged:
                              (cameraPosition, reason, finished) {
                            if (finished) {
                              _bloc.add(
                                MapEvent.changeByMap(cameraPosition.target),
                              );
                            } else {
                              _bloc.add(const MapEvent.scrollStarted());
                            }
                          },
                        ),
                        BlocBuilder<MapBloc, MapState>(
                          builder: (context, state) {
                            return state.maybeMap(
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
                            );
                          },
                        ),
                        Center(
                          child: BlocBuilder<MapBloc, MapState>(
                            bloc: _bloc,
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
                                          orElse: () => 30,
                                          hasScroll: (value) => 10,
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
                                        orElse: () => 0,
                                        hasScroll: (value) => -10,
                                      ),
                                      0,
                                    ),
                                    child: AnimatedSwitcher(
                                      duration: const Duration(seconds: 1),
                                      child: state.map(
                                        hasScroll: (value) =>
                                            const Icon(Icons.more_horiz),
                                        loading: (value) => const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: CircularProgressIndicator(),
                                        ),
                                        success: (value) =>
                                            const Icon(Icons.check),
                                        error: (value) =>
                                            const Icon(Icons.error_outline),
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
                            padding: const EdgeInsets.all(24.0),
                            child: FloatingActionButton(
                              onPressed: () async {
                                isScrolled.value = true;
                                await getLocation();
                                isScrolled.value = false;
                              },
                              backgroundColor: AppColors.white,
                              child: const Icon(Icons.gps_fixed),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        maximumSize: Size.infinite),
                    onPressed: () {},
                    child: const Text("Tasdiqlash"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
