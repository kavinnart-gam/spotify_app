import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'playlist_model.g.dart';

PlaylistsModel playlistsModelFromJson(String str) => PlaylistsModel.fromJson(json.decode(str));

String playlistsModelToJson(PlaylistsModel data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class PlaylistsModel {
  String message;
  Playlists playlists;

  PlaylistsModel({
    required this.message,
    required this.playlists,
  });

  factory PlaylistsModel.fromJson(Map<String, dynamic> json) => PlaylistsModel(
        message: json["message"],
        playlists: Playlists.fromJson(json["playlists"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "playlists": playlists.toJson(),
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Playlists {
  String href;
  List<Item> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  Playlists({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
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
  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  PrimaryColor primaryColor;
  bool public;
  String snapshotId;
  Tracks tracks;
  ItemType type;
  String uri;

  Item({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.primaryColor,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        primaryColor: primaryColorValues.map[json["primary_color"]]!,
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: itemTypeValues.map[json["type"]]!,
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "primary_color": primaryColorValues.reverse[primaryColor],
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toJson(),
        "type": itemTypeValues.reverse[type],
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
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Owner {
  DisplayName displayName;
  ExternalUrls externalUrls;
  String href;
  Id id;
  OwnerType type;
  Uri uri;

  Owner({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: displayNameValues.map[json["display_name"]]!,
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: idValues.map[json["id"]]!,
        type: ownerTypeValues.map[json["type"]]!,
        uri: uriValues.map[json["uri"]]!,
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayNameValues.reverse[displayName],
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": idValues.reverse[id],
        "type": ownerTypeValues.reverse[type],
        "uri": uriValues.reverse[uri],
      };
}

enum DisplayName { SPOTIFY }

final displayNameValues = EnumValues({"Spotify": DisplayName.SPOTIFY});

enum Id { SPOTIFY }

final idValues = EnumValues({"spotify": Id.SPOTIFY});

enum OwnerType { USER }

final ownerTypeValues = EnumValues({"user": OwnerType.USER});

enum Uri { SPOTIFY_USER_SPOTIFY }

final uriValues = EnumValues({"spotify:user:spotify": Uri.SPOTIFY_USER_SPOTIFY});

enum PrimaryColor { C3_F0_C8, FFFFFF, PRIMARY_COLOR_FFFFFF }

final primaryColorValues =
    EnumValues({"#C3F0C8": PrimaryColor.C3_F0_C8, "#ffffff": PrimaryColor.FFFFFF, "#FFFFFF": PrimaryColor.PRIMARY_COLOR_FFFFFF});

@JsonSerializable(fieldRename: FieldRename.snake)
class Tracks {
  String href;
  int total;

  Tracks({
    required this.href,
    required this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

enum ItemType { PLAYLIST }

final itemTypeValues = EnumValues({"playlist": ItemType.PLAYLIST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

PlayListResponseModel playListResponseModelFromJson(String str) => PlayListResponseModel.fromJson(json.decode(str));

String playListResponseModelToJson(PlayListResponseModel data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class PlayListResponseModel {
  String id;

  PlayListResponseModel({
    required this.id,
  });

  factory PlayListResponseModel.fromJson(Map<String, dynamic> json) => PlayListResponseModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
