import 'package:flutter/material.dart';

/// The [Favourites] class holds a list of favorite items saved by the user.
class Favourites extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}
