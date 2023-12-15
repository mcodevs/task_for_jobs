import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_for_job/common/config/extensions.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/common/constants/icons.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final Completer<YandexMapController> _controller = Completer();
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<MapObject> mapObjects = [];
  final ValueNotifier<bool> isScrolled = ValueNotifier(false);

  static final _icon = PlacemarkIcon.single(
    PlacemarkIconStyle(
      image: BitmapDescriptor.fromAssetImage(
        AppIcons.userIcon,
      ),
      anchor: const Offset(0.5, 1),
    ),
  );

  @override
  void initState() {
    super.initState();
    getLocationPermission();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0, end: 30).animate(_animationController);
    isScrolled.addListener(() async {
      if (isScrolled.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      final controller = await _controller.future;
      final position = await Geolocator.getCurrentPosition();
      await controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position.toPoint()),
        ),
        animation: const MapAnimation(duration: 3),
      );
    }
  }

  void _onMapCreated(YandexMapController controller) {
    controller.toggleUserLayer(visible: true);
    _controller.complete(controller);
  }

  Future<UserLocationView> _onUserLocationAdded(UserLocationView view) async {
    return view.copyWith(
      pin: view.pin.copyWith(
        icon: _icon,
        opacity: 1,
      ),
      accuracyCircle: view.accuracyCircle.copyWith(
        strokeColor: Colors.transparent,
        fillColor: Colors.transparent,
      ),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
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
                      ValueListenableBuilder(
                        valueListenable: isScrolled,
                        builder: (context, value, child) {
                          return YandexMap(
                            mapObjects: mapObjects,
                            logoAlignment: const MapAlignment(
                              horizontal: HorizontalAlignment.left,
                              vertical: VerticalAlignment.bottom,
                            ),
                            onUserLocationAdded: _onUserLocationAdded,
                            onMapCreated: _onMapCreated,
                            tiltGesturesEnabled: false,
                            onCameraPositionChanged: (
                              cameraPosition,
                              reason,
                              finished,
                            ) {
                              if (reason == CameraUpdateReason.gestures) {
                                if (finished) {
                                  mapObjects.add(
                                    PlacemarkMapObject(
                                      mapId: const MapObjectId("current"),
                                      point: cameraPosition.target,
                                      icon: PlacemarkIcon.single(
                                        PlacemarkIconStyle(
                                            image:
                                                BitmapDescriptor.fromAssetImage(
                                              AppIcons.userIconBlue,
                                            ),
                                            scale: 1.2,
                                            anchor: const Offset(0.5, 1)),
                                      ),
                                    ),
                                  );
                                } else {
                                  mapObjects.clear();
                                }
                                isScrolled.value = !finished;
                              }
                            },
                          );
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: isScrolled,
                          builder: (context, value, child) {
                            return value
                                ? ShaderMask(
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
                                  )
                                : const SizedBox.shrink();
                          }),
                      Center(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, -_animation.value - 20),
                              child: child,
                            );
                          },
                          child: ValueListenableBuilder(
                            valueListenable: isScrolled,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value ? 1 : 0,
                                child: Image.asset(
                                  AppIcons.userIcon,
                                  width: 30,
                                  fit: BoxFit.fitWidth,
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              final controller = await _controller.future;
                              final position =
                                  await controller.getUserCameraPosition();
                              if (position != null) {
                                await controller.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                      position.copyWith(zoom: 15)),
                                  animation: const MapAnimation(),
                                );
                              }
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
