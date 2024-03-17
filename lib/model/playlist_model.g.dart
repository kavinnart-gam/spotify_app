// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistsModel _$PlaylistsModelFromJson(Map<String, dynamic> json) =>
    PlaylistsModel(
      message: json['message'] as String,
      playlists: Playlists.fromJson(json['playlists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistsModelToJson(PlaylistsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'playlists': instance.playlists,
    };

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) => Playlists(
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

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
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
      primaryColor: $enumDecode(_$PrimaryColorEnumMap, json['primary_color']),
      public: json['public'] as bool,
      snapshotId: json['snapshot_id'] as String,
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
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
      'primary_color': _$PrimaryColorEnumMap[instance.primaryColor]!,
      'public': instance.public,
      'snapshot_id': instance.snapshotId,
      'tracks': instance.tracks,
      'type': _$ItemTypeEnumMap[instance.type]!,
      'uri': instance.uri,
    };

const _$PrimaryColorEnumMap = {
  PrimaryColor.C3_F0_C8: 'C3_F0_C8',
  PrimaryColor.FFFFFF: 'FFFFFF',
  PrimaryColor.PRIMARY_COLOR_FFFFFF: 'PRIMARY_COLOR_FFFFFF',
};

const _$ItemTypeEnumMap = {
  ItemType.PLAYLIST: 'PLAYLIST',
};

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) => ExternalUrls(
      spotify: json['spotify'] as String,
    );

Map<String, dynamic> _$ExternalUrlsToJson(ExternalUrls instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      displayName: $enumDecode(_$DisplayNameEnumMap, json['display_name']),
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: $enumDecode(_$IdEnumMap, json['id']),
      type: $enumDecode(_$OwnerTypeEnumMap, json['type']),
      uri: $enumDecode(_$UriEnumMap, json['uri']),
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': _$DisplayNameEnumMap[instance.displayName]!,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': _$IdEnumMap[instance.id]!,
      'type': _$OwnerTypeEnumMap[instance.type]!,
      'uri': _$UriEnumMap[instance.uri]!,
    };

const _$DisplayNameEnumMap = {
  DisplayName.SPOTIFY: 'SPOTIFY',
};

const _$IdEnumMap = {
  Id.SPOTIFY: 'SPOTIFY',
};

const _$OwnerTypeEnumMap = {
  OwnerType.USER: 'USER',
};

const _$UriEnumMap = {
  Uri.SPOTIFY_USER_SPOTIFY: 'SPOTIFY_USER_SPOTIFY',
};

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      href: json['href'] as String,
      total: json['total'] as int,
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'href': instance.href,
      'total': instance.total,
    };

PlayListResponseModel _$PlayListResponseModelFromJson(
        Map<String, dynamic> json) =>
    PlayListResponseModel(
      id: json['id'] as String,
    );

Map<String, dynamic> _$PlayListResponseModelToJson(
        PlayListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
