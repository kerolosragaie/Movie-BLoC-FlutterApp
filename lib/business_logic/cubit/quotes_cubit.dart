import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_flutter/data/models/quote_model.dart';
import 'package:movie_bloc_flutter/data/repositories/quotes_repository.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final QuoteRepository quoteRepository;
  List<QuoteModel> quotesList = [];
  QuotesCubit(this.quoteRepository) : super(QuotesInitial());
  List<QuoteModel> getAllQuotes(String author) {
    quoteRepository.getRandomQuote(author).then((quotes) {
      emit(QuotesLoaded(quotes));
      this.quotesList = quotes;
    });
    return quotesList;
  }
}
