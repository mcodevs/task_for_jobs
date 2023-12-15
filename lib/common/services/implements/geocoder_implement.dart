import 'package:task_for_job/common/constants/api_const.dart';
import 'package:task_for_job/common/services/api_service.dart';
import 'package:task_for_job/common/services/repository/geocoder_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

final class GeocoderImpl implements GeocoderRepository {
  final ApiService _service;

  GeocoderImpl() : _service = ApiService();

  @override
  Future<String> getAddress(Point point) async {
    final response = await _service.request<Map<String, Object?>>(
      queryParams: ApiConst.queryParams(point),
    );
    print(response.data);
    throw UnimplementedError();
  }
}
