import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'album_search_model.g.dart';

AlbumSearchModel albumSearchModelFromJson(String str) => AlbumSearchModel.fromJson(json.decode(str));

String albumSearchModelToJson(AlbumSearchModel data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class AlbumSearchModel {
  Albums albums;

  AlbumSearchModel({
    required this.albums,
  });

  factory AlbumSearchModel.fromJson(Map<String, dynamic> json) => AlbumSearchModel(
        albums: Albums.fromJson(json["albums"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums.toJson(),
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Albums {
  String href;
  List<Item> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  Albums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Item {
  String albumType;
  List<Artist> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  DateTime releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  Item({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        albumType: json["album_type"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Artist {
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  Artist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ExternalUrls {
  String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  int height;
  String url;
  int width;

  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
