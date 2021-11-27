import 'package:movie_bloc_flutter/data/api/charcthers_services.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';

class CharctherRepository {
  final CharcthersServices charcthersServices;

  CharctherRepository(this.charcthersServices);
  Future<List<CharcthersModel>> getAllCharcthers() async {
    final charcthersList = await charcthersServices.getAllCharcthers();
    return charcthersList
        .map((e) => CharcthersModel.fromJson(e.toJson()))
        .toList();
  }
}
