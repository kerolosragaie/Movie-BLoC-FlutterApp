import 'package:flutter/material.dart';
import 'package:movie_bloc_flutter/constants/pages.dart';
import 'package:movie_bloc_flutter/presentation/pages/pages.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charcthersPage:
        return MaterialPageRoute(builder: (_) => const CharctersPage());
      case charcthersDetailsPage:
        return MaterialPageRoute(builder: (_) => const CharcthersDetailsPage());
    }
  }
}
