import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/favourites.dart';
import 'package:collection/collection.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favourites>(context);
    final List myColors = [Colors.amber, Colors.blue, Colors.green, Colors.red, Colors.indigo];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: myColors.sample(1).single
          // /Theme.of(context).colorScheme.primary
          //Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item ${itemNo+1}',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
