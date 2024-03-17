import 'dart:convert';

import 'package:dio/dio.dart';

class PlayListService {
  var dio = Dio();
  String token =
      "BQCz3rMJ4OEqjWRQFsT8OVmCIjtpq1dOYK1UMFFcMu6ET3DA5U8niuQ7fmSh460BAm3UGBTuu1euJ8SzrfdhMhkuyZSzcy1NYmoAEbOmIiJixOLrPxzrC1wPxzfgGBXG3J3dYDAMXe-E-FzVFfl1UVSYot__gskJqre5M17hBZbquf3RVKljSNiOrKlG0mkYZZEdq6h3UO57A-m_dnC9ylVL1UcNTta7uno";

  String userId = "3134ujmbh7k2mk5ykdeso4fbva2i";

  Future<dynamic> getAuthorizationUrlService({
    required String state,
  }) async {
    var clientId = '6f011d46468a40a6963db13b1a5cc0a9';
    var redirectUri = 'http://localhost:3000';
    var scope = 'user-read-private user-read-email playlist-modify-public playlist-modify-private';

    try {
      final url = Uri.https(
        'accounts.spotify.com',
        '/authorize',
        {
          'response_type': 'code',
          'client_id': clientId,
          'scope': scope,
          'redirect_uri': redirectUri,
          'state': state, // Add state parameter
        },
      );

      print('Redirect URL: ${url.toString()}');

      return url.toString();
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  Future<String> exchangeCodeForToken() async {
    final grantType = 'authorization_code'; // OAuth grant type

    final dio = Dio(); // Create a Dio instance

    final formData = FormData.fromMap({
      'grant_type': 'authorization_code',
      'client_id': "6f011d46468a40a6963db13b1a5cc0a9",
      'client_secret': "f115b4ed658b4596b555426b218fe7b7", // Required for token exchange
      'redirect_uri': 'http://localhost:8888/callback',
      'code':
          "AQCMZpEs9ZJyaKeLIt-i9Ks4D2xAXPCd9g8QDmA_wCalyNiSRkfIucOFUaa1Mb7fJXIlrQTc32aY0ZrfDWGN1y2bcgUIqLdXmcbPR6Xgmb8prL4Mi8K3lMdG0Xe8KDJh0k7wtt-nssa98QhADzUKqfFo8GrKnYFXb0UAWgu9R1oR52hnnX__m2i5qM-TvofurvO6vHoAXBZG9C9hbk-RbDhBEstPGBE2xcTRvpy4_0i-vVFT4dSy5bhtlRSxbjPyEsUa25LwbjbwlV_mqzM",
    });

    try {
      final response = await dio.post(
        'https://accounts.spotify.com/api/token',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      final data = response.data as Map<String, dynamic>;

      if (response.statusCode == 200) {
        final accessToken = data['access_token'];;
        return accessToken;
      } else {
        throw Exception('Failed to exchange code for token: ${response.statusCode}');
      }
      // ignore: deprecated_member_use
    } on DioError catch (error) {
      throw Exception('Error exchanging code for token: ${error.message}');
    }
  }

  Future<dynamic> fetchPlayListService() async {
    try {
      String apiUrl = 'https://api.spotify.com/v1/browse/featured-playlists';

      Response response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (error) {
      print('Error: $error');
      return error;
    }
  }

  Future<dynamic> fetchPlayListDetailService(String playlistId) async {
    try {
      String apiUrl = 'https://api.spotify.com/v1/playlists/$playlistId?market=TH';

      Response response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (error) {
      print('Error: $error');
      return error;
    }
  }

  Future<dynamic> searchAlbumService(String name) async {
    try {
      String apiUrl = 'https://api.spotify.com/v1/search?q=$name&type=album&limit=20&offset=0';

      Response response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (error) {
      print('Error: $error');
      return error;
    }
  }

  Future<dynamic> createPlaylist(String name) async {
    String url = 'https://api.spotify.com/v1/users/$userId/playlists';

    final body = json.encode({
      'name': name,
      'description': '',
      'public': true,
    });

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        print('Failed to create playlist: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error creating playlist: $e');
      return e;
    }
  }

  Future<dynamic> addSongToPlaylistService(String playlistId, String trackId) async {
    String url = 'https://api.spotify.com/v1/playlists/$playlistId/tracks';

    final body = json.encode({
      'uris': [trackId],
      "position": 0
    });

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print('Error adding song to playlist: $e');
      return e;
    }
  }

  Future<dynamic> fetchMyLibraryService() async {
    try {
      String apiUrl = 'https://api.spotify.com/v1/me/playlists';

      Response response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (error) {
      print('Error: $error');
      return error;
    }
  }
}
