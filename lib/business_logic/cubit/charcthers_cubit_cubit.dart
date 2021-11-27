import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'charcthers_cubit_state.dart';

class CharcthersCubitCubit extends Cubit<CharcthersCubitState> {
  CharcthersCubitCubit() : super(CharcthersCubitInitial());
}
