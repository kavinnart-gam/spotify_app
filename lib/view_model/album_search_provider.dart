import 'package:flutter/material.dart';
import 'package:spotify_app/model/album_search_model.dart';

import '../services/playlist_service.dart';

class AlbumSearchProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  List<Item> albumItems = [];
  initData() {}

  Future searchAlbum(String name) async {
    _loading = true;
    notifyListeners();
    notifyListeners();
    PlayListService request = PlayListService();
    request.searchAlbumService(name).then((value) {
      if (value.statusCode == 200) {
        AlbumSearchModel response = AlbumSearchModel.fromJson(value.data);
        albumItems = response.albums.items;
        _loading = false;
      }

      notifyListeners();
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }
}
