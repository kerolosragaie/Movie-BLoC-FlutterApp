import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_flutter/data/models/charcthers.dart';
import 'package:movie_bloc_flutter/data/repositories/charcthers_repository.dart';

part 'charcthers_cubit_state.dart';

class CharcthersCubitCubit extends Cubit<CharcthersCubitState> {
  final CharctherRepository charctherRepository;
  late List<CharcthersModel> charcthers;

  CharcthersCubitCubit(this.charctherRepository)
      : super(CharcthersCubitInitial());

  List<CharcthersModel> getAllCharcthers() {
    charctherRepository.getAllCharcthers().then((charcthers) {
      emit(CharcthersLoaded(charcthers));
      this.charcthers = charcthers;
    });
    return charcthers;
  }
}
