import 'package:task_for_job/common/constants/api_const.dart';
import 'package:task_for_job/common/services/api_service.dart';
import 'package:task_for_job/common/services/repository/geocoder_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

final class GeocoderImpl implements GeocoderRepository {
  final ApiService _service;

  GeocoderImpl() : _service = ApiService();

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
  Future<String> getAddress(Point point) async {
    final response = await _service.request<Map<String, Object?>>(
      queryParams: ApiConst.queryParams(point),
    );
    print(response.data);
    return response.data.toString();
  }
}
