import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'playlist_detail_model.g.dart';

PlaylistDetailModel playlistDetailModelFromJson(String str) => PlaylistDetailModel.fromJson(json.decode(str));

String playlistDetailModelToJson(PlaylistDetailModel data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class PlaylistDetailModel {
  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  String primaryColor;
  bool public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  PlaylistDetailModel({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.followers,
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

  factory PlaylistDetailModel.fromJson(Map<String, dynamic> json) => PlaylistDetailModel(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toJson(),
        "followers": followers.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toJson(),
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
class Followers {
  dynamic href;
  int total;

  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  int? height;
  String url;
  int? width;

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

@JsonSerializable(fieldRename: FieldRename.snake)
class Owner {
  String? displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  OwnerType type;
  String uri;
  String? name;

  Owner({
    this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: ownerTypeValues.map[json["type"]]!,
        uri: json["uri"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "type": ownerTypeValues.reverse[type],
        "uri": uri,
        "name": name,
      };
}

enum OwnerType { ARTIST, USER }

final ownerTypeValues = EnumValues({"artist": OwnerType.ARTIST, "user": OwnerType.USER});

@JsonSerializable(fieldRename: FieldRename.snake)
class Tracks {
  String href;
  List<Item> items;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;

  Tracks({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
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
  DateTime addedAt;
  Owner addedBy;
  bool isLocal;
  dynamic primaryColor;
  Track track;
  VideoThumbnail videoThumbnail;

  Item({
    required this.addedAt,
    required this.addedBy,
    required this.isLocal,
    required this.primaryColor,
    required this.track,
    required this.videoThumbnail,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        addedAt: DateTime.parse(json["added_at"]),
        addedBy: Owner.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: Track.fromJson(json["track"]),
        videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt.toIso8601String(),
        "added_by": addedBy.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track.toJson(),
        "video_thumbnail": videoThumbnail.toJson(),
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Track {
  Album album;
  List<Owner> artists;
  int discNumber;
  int durationMs;
  bool episode;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  bool isPlayable;
  String name;
  int popularity;
  String? previewUrl;
  bool track;
  int trackNumber;
  TrackType type;
  String uri;

  Track({
    required this.album,
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.episode,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.isPlayable,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.track,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json["album"]),
        artists: List<Owner>.from(json["artists"].map((x) => Owner.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        episode: json["episode"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        track: json["track"],
        trackNumber: json["track_number"],
        type: trackTypeValues.map[json["type"]]!,
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "episode": episode,
        "explicit": explicit,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track": track,
        "track_number": trackNumber,
        "type": trackTypeValues.reverse[type],
        "uri": uri,
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Album {
  AlbumTypeEnum albumType;
  List<Owner> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  bool isPlayable;
  String name;
  DateTime releaseDate;
  ReleaseDatePrecision releaseDatePrecision;
  int totalTracks;
  AlbumTypeEnum type;
  String uri;

  Album({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.isPlayable,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: albumTypeEnumValues.map[json["album_type"]]!,
        artists: List<Owner>.from(json["artists"].map((x) => Owner.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        isPlayable: json["is_playable"],
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]]!,
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumTypeEnumValues.reverse[albumType],
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "is_playable": isPlayable,
        "name": name,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
      };
}

enum AlbumTypeEnum { ALBUM, SINGLE }

final albumTypeEnumValues = EnumValues({"album": AlbumTypeEnum.ALBUM, "single": AlbumTypeEnum.SINGLE});

enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues = EnumValues({"day": ReleaseDatePrecision.DAY});

@JsonSerializable(fieldRename: FieldRename.snake)
class ExternalIds {
  String isrc;

  ExternalIds({
    required this.isrc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}

enum TrackType { TRACK }

final trackTypeValues = EnumValues({"track": TrackType.TRACK});

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoThumbnail {
  dynamic url;

  VideoThumbnail({
    required this.url,
  });

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
