import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/view_model/album_search_provider.dart';

class AlbumSearchScreen extends StatelessWidget {
  const AlbumSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider(
          create: (context) => AlbumSearchProvider(),
          child: Consumer<AlbumSearchProvider>(builder: (context, provider, _) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    child: TextField(
                      showCursor: true,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.none,
                      onChanged: (value) => provider.searchAlbum(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 45, 44, 44),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0XFFA0AEC0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), borderSide: const BorderSide(color: Color.fromARGB(255, 45, 44, 44))),
                        hintText: 'What do you want to listen to?',
                        hintStyle: const TextStyle(color: Color(0xFFA0AEC0), fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )),
                centerTitle: true,
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              body: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: provider.albumItems.length,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: provider.albumItems[index].images.last.url,
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
                                  provider.albumItems[index].name,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      provider.albumItems[index].type,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      " • ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      provider.albumItems[index].artists.first.name,
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
                    );
                  }),
            );
          })),
    );
  }
}
