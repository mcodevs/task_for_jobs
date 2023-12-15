import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract interface class GeocoderRepository {
  Future<String> getAddress(Point point);
}