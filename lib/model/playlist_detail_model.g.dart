// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistDetailModel _$PlaylistDetailModelFromJson(Map<String, dynamic> json) =>
    PlaylistDetailModel(
      collaborative: json['collaborative'] as bool,
      description: json['description'] as String,
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      followers: Followers.fromJson(json['followers'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      primaryColor: json['primary_color'] as String,
      public: json['public'] as bool,
      snapshotId: json['snapshot_id'] as String,
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$PlaylistDetailModelToJson(
        PlaylistDetailModel instance) =>
    <String, dynamic>{
      'collaborative': instance.collaborative,
      'description': instance.description,
      'external_urls': instance.externalUrls,
      'followers': instance.followers,
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

Followers _$FollowersFromJson(Map<String, dynamic> json) => Followers(
      href: json['href'],
      total: json['total'] as int,
    );

Map<String, dynamic> _$FollowersToJson(Followers instance) => <String, dynamic>{
      'href': instance.href,
      'total': instance.total,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      height: json['height'] as int?,
      url: json['url'] as String,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      displayName: json['display_name'] as String?,
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      type: $enumDecode(_$OwnerTypeEnumMap, json['type']),
      uri: json['uri'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': _$OwnerTypeEnumMap[instance.type]!,
      'uri': instance.uri,
      'name': instance.name,
    };

const _$OwnerTypeEnumMap = {
  OwnerType.ARTIST: 'ARTIST',
  OwnerType.USER: 'USER',
};

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
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

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      addedAt: DateTime.parse(json['added_at'] as String),
      addedBy: Owner.fromJson(json['added_by'] as Map<String, dynamic>),
      isLocal: json['is_local'] as bool,
      primaryColor: json['primary_color'],
      track: Track.fromJson(json['track'] as Map<String, dynamic>),
      videoThumbnail: VideoThumbnail.fromJson(
          json['video_thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'added_at': instance.addedAt.toIso8601String(),
      'added_by': instance.addedBy,
      'is_local': instance.isLocal,
      'primary_color': instance.primaryColor,
      'track': instance.track,
      'video_thumbnail': instance.videoThumbnail,
    };

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      album: Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: json['disc_number'] as int,
      durationMs: json['duration_ms'] as int,
      episode: json['episode'] as bool,
      explicit: json['explicit'] as bool,
      externalIds:
          ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      isLocal: json['is_local'] as bool,
      isPlayable: json['is_playable'] as bool,
      name: json['name'] as String,
      popularity: json['popularity'] as int,
      previewUrl: json['preview_url'] as String?,
      track: json['track'] as bool,
      trackNumber: json['track_number'] as int,
      type: $enumDecode(_$TrackTypeEnumMap, json['type']),
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'album': instance.album,
      'artists': instance.artists,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'episode': instance.episode,
      'explicit': instance.explicit,
      'external_ids': instance.externalIds,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'is_local': instance.isLocal,
      'is_playable': instance.isPlayable,
      'name': instance.name,
      'popularity': instance.popularity,
      'preview_url': instance.previewUrl,
      'track': instance.track,
      'track_number': instance.trackNumber,
      'type': _$TrackTypeEnumMap[instance.type]!,
      'uri': instance.uri,
    };

const _$TrackTypeEnumMap = {
  TrackType.TRACK: 'TRACK',
};

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      albumType: $enumDecode(_$AlbumTypeEnumEnumMap, json['album_type']),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalUrls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPlayable: json['is_playable'] as bool,
      name: json['name'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      releaseDatePrecision: $enumDecode(
          _$ReleaseDatePrecisionEnumMap, json['release_date_precision']),
      totalTracks: json['total_tracks'] as int,
      type: $enumDecode(_$AlbumTypeEnumEnumMap, json['type']),
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'album_type': _$AlbumTypeEnumEnumMap[instance.albumType]!,
      'artists': instance.artists,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'is_playable': instance.isPlayable,
      'name': instance.name,
      'release_date': instance.releaseDate.toIso8601String(),
      'release_date_precision':
          _$ReleaseDatePrecisionEnumMap[instance.releaseDatePrecision]!,
      'total_tracks': instance.totalTracks,
      'type': _$AlbumTypeEnumEnumMap[instance.type]!,
      'uri': instance.uri,
    };

const _$AlbumTypeEnumEnumMap = {
  AlbumTypeEnum.ALBUM: 'ALBUM',
  AlbumTypeEnum.SINGLE: 'SINGLE',
};

const _$ReleaseDatePrecisionEnumMap = {
  ReleaseDatePrecision.DAY: 'DAY',
};

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds(
      isrc: json['isrc'] as String,
    );

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'isrc': instance.isrc,
    };

VideoThumbnail _$VideoThumbnailFromJson(Map<String, dynamic> json) =>
    VideoThumbnail(
      url: json['url'],
    );

Map<String, dynamic> _$VideoThumbnailToJson(VideoThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
