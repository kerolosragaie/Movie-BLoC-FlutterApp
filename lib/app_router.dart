import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/charcthers_cubit.dart';
import 'package:movie_bloc_flutter/constants/pages.dart';
import 'package:movie_bloc_flutter/data/api/charcthers_services.dart';
import 'package:movie_bloc_flutter/data/repositories/charcthers_repository.dart';
import 'package:movie_bloc_flutter/presentation/pages/pages.dart';

class AppRouter {
  late CharctherRepository charctherRepository;
  late CharcthersCubit charcthersCubit;

  AppRouter() {
    //to easily pass value of BlocProvider from one page to another
    charctherRepository = CharctherRepository(CharcthersServices());
    charcthersCubit = CharcthersCubit(charctherRepository);
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
        return MaterialPageRoute(builder: (_) => const CharcthersDetailsPage());
    }
  }
}
