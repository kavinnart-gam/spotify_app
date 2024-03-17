import 'package:flutter/material.dart';
import 'package:spotify_app/model/playlist_model.dart';
import 'package:spotify_app/services/playlist_service.dart';
import 'package:spotify_app/view/album_search_screen.dart';
import 'package:spotify_app/view/library_screen.dart';

import '../view/home_page.dart';

class HomeProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  bool _loading = true;
  bool get loading => _loading;
  String _playlistId = "";
  String get playlistId => _playlistId;
  Playlists? playlists;
  String redirectUrl = "";

  final List<Widget> _pages = <Widget>[
    const HomePage(), // selectedIndex is 0
    const AlbumSearchScreen(), // selectedIndex is 1
    const LibraryScreen(), // selectedIndex is 2
  ];
  List<Widget> get pages => _pages;

  void onItemTapped(int index, BuildContext ctx) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setPlaylistDetailId(String id) {
    _playlistId = id;
    notifyListeners();
  }

  initialData() async {
    // _loading = false;
    //await getAuthorizationUrl();
    await fetchPlayList();
    notifyListeners();
  }

  // Future getAuthorizationUrl() async {
  //   PlayListService request = PlayListService();
  //   request.getAuthorizationUrlService(state: generateRandomString(16)).then((value) {
  //     redirectUrl = value;
  //     notifyListeners();
  //   }).catchError((onError) {
  //     print("Error");
  //     _loading = false;
  //     notifyListeners();
  //   });
  // }

  Future fetchPlayList() async {
    PlayListService request = PlayListService();
    request.fetchPlayListService().then((value) {
      if (value.statusCode == 200) {
        PlaylistsModel response = PlaylistsModel.fromJson(value.data);
        playlists = response.playlists;
        _loading = false;
      }

      notifyListeners();
    }).catchError((onError) {
      print("Error");
      _loading = false;
      notifyListeners();
    });
  }

  // String generateRandomString(int length) {
  //   var text = '';
  //   var random = Random();
  //   var possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  //   for (var i = 0; i < length; i++) {
  //     text += possible[random.nextInt(possible.length)];
  //   }
  //   return text;
  // }
}
