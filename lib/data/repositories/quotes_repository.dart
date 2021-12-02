import 'package:movie_bloc_flutter/data/api/quotes_services.dart';
import 'package:movie_bloc_flutter/data/models/quote_model.dart';

class QuoteRepository {
  final QuotesServices quotesServices;
  QuoteRepository(this.quotesServices);
  Future<List<QuoteModel>> getRandomQuote(String author) async {
    final quotesList = await quotesServices.getRandomQuote(author);
    return quotesList.map((quote) => QuoteModel.fromJson(quote)).toList();
  }
}
