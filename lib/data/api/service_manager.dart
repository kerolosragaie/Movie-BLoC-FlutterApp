import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/constants/api_base_url.dart';

class ServiceManager {
  late Dio dio;

  ServiceManager() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //60 secs
      receiveTimeout: 10 * 1000, // 10 secs
    );
    dio = Dio(baseOptions);
  }
}
