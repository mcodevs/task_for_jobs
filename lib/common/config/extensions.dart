import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

extension PositionExtension on Position {
  Point toPoint() {
    return Point(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension PointExtension on Point {
  static Point fromJson(Map<String, dynamic> json) {
    return Point(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}
