// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumSearchModel _$AlbumSearchModelFromJson(Map<String, dynamic> json) =>
    AlbumSearchModel(
      albums: Albums.fromJson(json['albums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumSearchModelToJson(AlbumSearchModel instance) =>
    <String, dynamic>{
      'albums': instance.albums,
    };

Albums _$AlbumsFromJson(Map<String, dynamic> json) => Albums(
      href: json['href'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int,
      next: json['next'] as String,
      offset: json['offset'] as int,
      previous: json['previous'],
      total: json['total'] as int,
    );

Map<String, dynamic> _$AlbumsToJson(Albums instance) => <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      albumType: json['album_type'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      releaseDatePrecision: json['release_date_precision'] as String,
      totalTracks: json['total_tracks'] as int,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'album_type': instance.albumType,
      'artists': instance.artists,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'release_date': instance.releaseDate.toIso8601String(),
      'release_date_precision': instance.releaseDatePrecision,
      'total_tracks': instance.totalTracks,
      'type': instance.type,
      'uri': instance.uri,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) => ExternalUrls(
      spotify: json['spotify'] as String,
    );

Map<String, dynamic> _$ExternalUrlsToJson(ExternalUrls instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      height: json['height'] as int,
      url: json['url'] as String,
      width: json['width'] as int,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
