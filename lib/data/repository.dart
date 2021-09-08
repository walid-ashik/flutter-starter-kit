import 'package:sma/features/home/model/global.dart';
import 'api_service.dart';

abstract class ScaledRepository {
  Future<Global> fetchGlobalData();
}


class Repository implements ScaledRepository {

  final _apiService = ApiService();

  @override
  Future<Global> fetchGlobalData() async {
    return _apiService.fetchGlobalData();
  }

}