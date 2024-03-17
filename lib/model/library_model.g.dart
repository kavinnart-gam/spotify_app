// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryModel _$LibraryModelFromJson(Map<String, dynamic> json) => LibraryModel(
      href: json['href'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int,
      next: json['next'],
      offset: json['offset'] as int,
      previous: json['previous'],
      total: json['total'] as int,
    );

Map<String, dynamic> _$LibraryModelToJson(LibraryModel instance) =>
    <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      collaborative: json['collaborative'] as bool,
      description: json['description'] as String,
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      primaryColor: json['primary_color'],
      public: json['public'] as bool,
      snapshotId: json['snapshot_id'] as String,
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'collaborative': instance.collaborative,
      'description': instance.description,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'owner': instance.owner,
      'primary_color': instance.primaryColor,
      'public': instance.public,
      'snapshot_id': instance.snapshotId,
      'tracks': instance.tracks,
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

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      displayName: json['display_name'] as String,
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': instance.type,
      'uri': instance.uri,
    };

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      href: json['href'] as String,
      total: json['total'] as int,
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'href': instance.href,
      'total': instance.total,
    };
