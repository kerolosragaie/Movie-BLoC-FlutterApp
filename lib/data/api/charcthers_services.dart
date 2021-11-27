import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/data/api/service_manager.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';

class CharcthersServices {
  late ServiceManager serviceManager;

  CharcthersServices() {
    serviceManager = ServiceManager();
  }

  Future<List<CharcthersModel>> getAllCharcthers() async {
    try {
      Response response = await serviceManager.dio.get("characters");
      // ignore: avoid_print
      print(response.data);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print("Error: " + e.toString());
      return [];
    }
  }
}
