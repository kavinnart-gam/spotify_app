import 'package:flutter/material.dart';
import 'package:spotify_app/model/library_model.dart';

import '../services/playlist_service.dart';

class LibraryProvider extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;
  List<Item> libraryItems = [];

  Future fetchPlayList() async {
    PlayListService request = PlayListService();
    request.fetchMyLibraryService().then((value) {
      if (value.statusCode == 200) {
        LibraryModel response = LibraryModel.fromJson(value.data);
        libraryItems = response.items;

        _loading = false;
        notifyListeners();
      }
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }
}
