import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/view_model/home_provider.dart';

import 'album_search_screen.dart';
import 'home_page.dart';
import 'playlist_detail_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: provider.selectedIndex == 1 || provider.selectedIndex == 2
            ? provider.pages.elementAt(provider.selectedIndex)
            : Navigator(
                onGenerateRoute: (settings) {
                  Widget page = const HomePage();
                  if (settings.name == 'playlistDetail') {
                    page = PlaylistDetailScreen(
                      playlistId: provider.playlistId,
                    );
                  } else if (settings.name == "albumSearch") {
                    page = const AlbumSearchScreen();
                  }
                  return MaterialPageRoute(builder: (_) => page);
                },
              ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          currentIndex: provider.selectedIndex,
          onTap: (value) {
            provider.onItemTapped(value, context);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              label: 'Library',
            ),
          ],
        ),
      );
    });
  }
}
