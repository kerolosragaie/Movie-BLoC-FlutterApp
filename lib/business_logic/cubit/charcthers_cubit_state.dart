part of 'charcthers_cubit_cubit.dart';

@immutable
abstract class CharcthersCubitState {}

class CharcthersCubitInitial extends CharcthersCubitState {}

class CharcthersLoaded extends CharcthersCubitState {
  final List<CharcthersModel> charcthers;
  CharcthersLoaded(this.charcthers);
}
