import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AnimalRepository {
  final Dio _dio = Dio();
  
  Future<String>getCatImage() async {
    _dio.interceptors.add(TalkerDioLogger());
    final Response response = await _dio.get("https://api.thecatapi.com/v1/images/search");
    return response.data.first["url"];
  }
}