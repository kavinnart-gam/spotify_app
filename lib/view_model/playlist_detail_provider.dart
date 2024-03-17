import 'package:flutter/material.dart';
import 'package:spotify_app/model/playlist_detail_model.dart';
import 'package:spotify_app/model/library_model.dart' as library_model;
import '../model/playlist_model.dart';
import '../services/playlist_service.dart';

class PlayLitsDetailProvider extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;
  PlaylistDetailModel? playlistDetail;
  List<library_model.Item> libraryItems = [];

  initData(String playlistId) async {
    await fetchMyLibrary();
    await fetchPlayListDetail(playlistId);
  }

  Future fetchPlayListDetail(String playlistId) async {
    PlayListService request = PlayListService();
    request.fetchPlayListDetailService(playlistId).then((value) {
      if (value.statusCode == 200) {
        PlaylistDetailModel response = PlaylistDetailModel.fromJson(value.data);
        playlistDetail = response;
        _loading = false;
      }

      notifyListeners();
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }

  Future fetchMyLibrary() async {
    PlayListService request = PlayListService();
    request.fetchMyLibraryService().then((value) {
      if (value.statusCode == 200) {
        library_model.LibraryModel response = library_model.LibraryModel.fromJson(value.data);
        libraryItems = response.items;
      }
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }

  String formatDuration(int durationMs) {
    int seconds = (durationMs / 1000).truncate();
    int minutes = seconds ~/ 60;
    seconds %= 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Future createPlaylist(String playlistName, String trackId) async {
    PlayListService request = PlayListService();
    request.createPlaylist(playlistName).then((value) {
      if (value.statusCode == 201) {
        PlayListResponseModel response = PlayListResponseModel.fromJson(value.data);
        addSongToPlaylist(response.id, trackId);
      }
      print(playlistDetail);

      notifyListeners();
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }

  Future addSongToPlaylist(String playlistId, String trackId) async {
    PlayListService request = PlayListService();
    request.addSongToPlaylistService(playlistId, trackId).then((value) {
      return true;
    }).catchError((onError) {
      return false;
    });
  }
}
