import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/view_model/library_provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Your Library',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.black,
        ),
        body: ChangeNotifierProvider(
          create: (context) => LibraryProvider()..fetchPlayList(),
          child: Consumer<LibraryProvider>(builder: (context, provider, _) {
            return provider.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.libraryItems.length,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    itemBuilder: (context, index) {
                      return Container(
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
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                      );
                    });
          }),
        ));
  }
}
