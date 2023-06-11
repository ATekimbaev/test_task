part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class GetAlbumEvent extends AlbumEvent {}

class GetUsersAlbums extends AlbumEvent {
  final int id;
  GetUsersAlbums({required this.id});
}
