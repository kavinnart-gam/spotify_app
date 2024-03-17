import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/model/playlist_model.dart';

class PlayListItemWidget extends StatelessWidget {
  final Item playlistItem;

  PlayListItemWidget({
    Key? key,
    required this.playlistItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: playlistItem.images.first.url,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              playlistItem.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              playlistItem.description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}
