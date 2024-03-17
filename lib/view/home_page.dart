import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/view/widget/playlist_item_widget.dart';
import 'package:spotify_app/view_model/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Mixed for you',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'albumSearch');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Consumer<HomeProvider>(builder: (_, provider, __) {
            return provider.loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.playlists!.items.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (BuildContext ctx, int index) {
                      return GestureDetector(
                        onTap: () {
                          homeProvider.setPlaylistDetailId(provider.playlists!.items[index].id);
                          Navigator.pushNamed(context, 'playlistDetail');
                        },
                        child: PlayListItemWidget(
                          playlistItem: provider.playlists!.items[index],
                        ),
                      );
                    },
                  );
          }),
        ),
      ),
    );
  }
}
