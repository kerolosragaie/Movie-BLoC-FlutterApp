import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/data/api/service_manager.dart';

class CharcthersServices {
  late ServiceManager serviceManager;

  CharcthersServices() {
    serviceManager = ServiceManager();
  }

  Future<List<dynamic>> getAllCharcthers() async {
    try {
      Response response = await serviceManager.dio.get("characters");
      //print(response.data.toString());
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print("Error: " + e.toString());
      return [];
    }
  }
}
