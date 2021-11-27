import 'package:flutter/material.dart';

import 'package:movie_bloc_flutter/app_router.dart';

void main() {
  runApp(MovieBlocApp(
    appRouter: AppRouter(),
  ));
}

class MovieBlocApp extends StatelessWidget {
  final AppRouter appRouter;
  const MovieBlocApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie BLoC',
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
