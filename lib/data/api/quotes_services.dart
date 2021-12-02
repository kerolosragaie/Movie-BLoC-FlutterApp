import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/data/api/service_manager.dart';
import 'package:movie_bloc_flutter/data/models/quote_model.dart';

class QuotesServices {
  late ServiceManager serviceManager;

  QuotesServices() {
    serviceManager = ServiceManager();
  }

  Future<List<dynamic>> getRandomQuote(String author) async {
    try {
      Response response = await serviceManager.dio
          .get("quote", queryParameters: {"author": author});
      print(response.data.toString());
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print("Error: " + e.toString());
      return [];
    }
  }
}
