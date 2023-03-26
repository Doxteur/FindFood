import 'package:flutter/material.dart';
import 'package:spotifyclone/models/post.dart';

class Favorites extends ChangeNotifier {
  List<Post> _favoritesList = [];

  List<Post> get favoritesList => _favoritesList;

  void addFavorite(Post post) {
    _favoritesList.add(post);
    notifyListeners();
  }

  void removeFavorite(Post post) {
    _favoritesList.remove(post);
    notifyListeners();
  }
}
