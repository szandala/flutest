import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'favourites_page.dart';
import 'single_item.dart';

class Home extends StatelessWidget {
  static String routeName = '/';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App for Testing'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavouritesPage.routeName}');
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favourites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}
