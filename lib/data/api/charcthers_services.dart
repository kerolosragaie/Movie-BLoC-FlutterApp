import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/data/api/service_manager.dart';

class CharcthersServices {
  ServiceManager serviceManager = ServiceManager();

  Future<List<dynamic>> getAllCharcthers() async {
    try {
      Response response = await serviceManager.dio.get("characters");
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
