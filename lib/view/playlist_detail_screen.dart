import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/view_model/playlist_detail_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlaylistDetailScreen extends StatelessWidget {
  final String playlistId;
  PlaylistDetailScreen({Key? key, required this.playlistId}) : super(key: key);
  TextEditingController playlistNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'detail',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white, // Change to any color you want
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your search functionality here
              },
            ),
          ],
        ),
        body: ChangeNotifierProvider(
            create: (context) => PlayLitsDetailProvider()..initData(playlistId),
            child: Consumer<PlayLitsDetailProvider>(builder: (context, provider, _) {
              return provider.loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: provider.playlistDetail!.images.first.url,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              provider.playlistDetail!.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: provider.playlistDetail!.tracks.items.length,
                              padding: const EdgeInsets.all(20),
                              itemBuilder: (context, index) {
                                final trackItem = provider.playlistDetail!.tracks.items[index];
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              trackItem.track.name,
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    trackItem.track.artists.first.name ?? "",
                                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                                  ),
                                                ),
                                                const Text(
                                                  " • ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  provider.formatDuration(trackItem.track.durationMs),
                                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor: Colors.transparent,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.5,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.black87,
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(12.5),
                                                          topRight: Radius.circular(12.5),
                                                        ),
                                                      ),
                                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                                      child: SingleChildScrollView(
                                                        physics: const BouncingScrollPhysics(),
                                                        child: Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: Colors.white, // สีพื้นหลัง
                                                                foregroundColor: Colors.black, // สีข้อความ
                                                              ),
                                                              child: const Text(
                                                                'New playlist',
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                              onPressed: () {
                                                                String trackId = trackItem.track.uri;
                                                                showModalBottomSheet(
                                                                    backgroundColor: Colors.black87,
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      return Container(
                                                                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                                                                        color: Colors.black87,
                                                                        height: MediaQuery.of(context).size.height,
                                                                        width: MediaQuery.of(context).size.width,
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            TextField(
                                                                              showCursor: true,
                                                                              cursorColor: Colors.white,
                                                                              keyboardType: TextInputType.none,
                                                                              controller: playlistNameCtrl,
                                                                              style: const TextStyle(color: Colors.white),
                                                                              decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: const Color.fromARGB(255, 45, 44, 44),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                    borderSide:
                                                                                        const BorderSide(color: Color.fromARGB(255, 45, 44, 44))),
                                                                                hintText: '',
                                                                                hintStyle: const TextStyle(color: Color(0xFFA0AEC0), fontSize: 12),
                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            ElevatedButton(
                                                                              child: const Text(
                                                                                'Create',
                                                                                style: TextStyle(color: Colors.black),
                                                                              ),
                                                                              onPressed: () {
                                                                                provider.createPlaylist(playlistNameCtrl.text, trackId);
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  const SnackBar(
                                                                                    content: Text(
                                                                                      "Created library success!",
                                                                                      style: TextStyle(color: Colors.white),
                                                                                    ),
                                                                                    duration: Duration(seconds: 2),
                                                                                  ),
                                                                                );
                                                                                Future.delayed(const Duration(seconds: 2), () {
                                                                                  Navigator.of(context).pop();
                                                                                  Navigator.of(context).pop();
                                                                                });
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            ListView.builder(
                                                                physics: const BouncingScrollPhysics(),
                                                                scrollDirection: Axis.vertical,
                                                                shrinkWrap: true,
                                                                itemCount: provider.libraryItems.length,
                                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                                itemBuilder: (context, index) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      provider.addSongToPlaylist(
                                                                          provider.libraryItems[index].id, trackItem.track.uri);
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                        const SnackBar(
                                                                          content: Text(
                                                                            "Add to library success!",
                                                                            style: TextStyle(color: Colors.white),
                                                                          ),
                                                                          duration: Duration(seconds: 2),
                                                                        ),
                                                                      );
                                                                      Future.delayed(const Duration(seconds: 2), () {
                                                                        Navigator.of(context).pop();
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                      child: Row(
                                                                        children: [
                                                                          provider.libraryItems[index].images.isEmpty
                                                                              ? const SizedBox(
                                                                                  width: 50,
                                                                                )
                                                                              : CachedNetworkImage(
                                                                                  imageUrl: provider.libraryItems[index].images.last.url,
                                                                                  width: 50,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                          const SizedBox(
                                                                            width: 20,
                                                                          ),
                                                                          Expanded(
                                                                            child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  provider.libraryItems[index].name,
                                                                                  style: const TextStyle(
                                                                                      color: Colors.white, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      provider.libraryItems[index].type,
                                                                                      style: const TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                    const Text(
                                                                                      " • ",
                                                                                      style: TextStyle(color: Colors.grey),
                                                                                    ),
                                                                                    Text(
                                                                                      provider.libraryItems[index].owner.displayName,
                                                                                      style: const TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                })
                                                          ],
                                                        ),
                                                      ),
                                                    ));
                                              });
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
            })));
  }
}
