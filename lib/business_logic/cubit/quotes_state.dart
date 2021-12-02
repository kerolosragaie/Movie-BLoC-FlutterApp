part of 'quotes_cubit.dart';

@immutable
abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesLoaded extends QuotesState {
  final List<QuoteModel> quotes;
  QuotesLoaded(this.quotes);
}
