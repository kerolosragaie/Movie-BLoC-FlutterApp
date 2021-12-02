import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/charcthers_cubit.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/quotes_cubit.dart';
import 'package:movie_bloc_flutter/constants/pages.dart';
import 'package:movie_bloc_flutter/data/api/charcthers_services.dart';
import 'package:movie_bloc_flutter/data/api/quotes_services.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';
import 'package:movie_bloc_flutter/data/repositories/charcthers_repository.dart';
import 'package:movie_bloc_flutter/data/repositories/quotes_repository.dart';
import 'package:movie_bloc_flutter/presentation/pages/pages.dart';

class AppRouter {
  //For charcthers:
  late CharctherRepository charctherRepository;
  late CharcthersCubit charcthersCubit;

  //For quotes:
  late QuoteRepository quoteRepository;
  late QuotesCubit quotesCubit;

  AppRouter() {
    //to easily pass value of BlocProvider from one page to another
    charctherRepository = CharctherRepository(CharcthersServices());
    charcthersCubit = CharcthersCubit(charctherRepository);

    quoteRepository = QuoteRepository(QuotesServices());
    quotesCubit = QuotesCubit(quoteRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charcthersPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharcthersCubit(charctherRepository),
            child: const CharctersPage(),
          ),
        );
      case charcthersDetailsPage:
        {
          final selectedCharcther = settings.arguments as CharcthersModel;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (BuildContext context) =>
                        QuotesCubit(quoteRepository),
                    child: CharcthersDetailsPage(
                      currentCharcther: selectedCharcther,
                    ),
                  ));
        }
    }
  }
}
