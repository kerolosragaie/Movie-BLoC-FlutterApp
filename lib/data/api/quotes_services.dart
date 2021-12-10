import 'package:dio/dio.dart';
import 'package:movie_bloc_flutter/data/api/service_manager.dart';

class QuotesServices {
  ServiceManager serviceManager = ServiceManager();

  Future<List<dynamic>> getRandomQuote(String author) async {
    try {
      Response response = await serviceManager.dio
          .get("quote", queryParameters: {"author": author});
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
