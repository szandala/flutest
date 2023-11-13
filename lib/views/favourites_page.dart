import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'single_favourite.dart';
import '../data/favourites.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Consumer<Favourites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavouriteItemTile(value.items[index]),
        ),
      ),
    );
  }
}
