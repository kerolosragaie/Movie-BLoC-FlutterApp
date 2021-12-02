import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';
import 'package:movie_bloc_flutter/data/repositories/charcthers_repository.dart';
part 'charcthers_state.dart';

class CharcthersCubit extends Cubit<CharcthersCubitState> {
  final CharctherRepository charctherRepository;
  List<CharcthersModel> charcthers = [];

  CharcthersCubit(this.charctherRepository) : super(CharcthersCubitInitial());

  List<CharcthersModel> getAllCharcthers() {
    charctherRepository.getAllCharcthers().then((charcthers) {
      emit(CharcthersLoaded(charcthers));
      this.charcthers = charcthers;
    });
    return charcthers;
  }
}
