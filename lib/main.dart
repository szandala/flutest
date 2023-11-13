import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'data/favourites.dart';
import 'views/favourites_page.dart';
import 'views/home.dart';

void main() {
  runApp(const Flutest());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: Home.routeName,
      builder: (context, state) {
        return const Home();
      },
      routes: [
        GoRoute(
          path: FavouritesPage.routeName,
          builder: (context, state) {
            return const FavouritesPage();
          },
        ),
      ],
    ),
  ],
);

class Flutest extends StatelessWidget {
  const Flutest({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favourites>(
      create: (context) => Favourites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
