part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumSuccessState extends AlbumState {
  final List<AlbumModel> model;
  AlbumSuccessState({required this.model});
}

class UsersAlbumsSuccessState extends AlbumState {
  final List<AlbumModelWithPhotos> model;
  UsersAlbumsSuccessState({required this.model});
}

class AlbumErrorState extends AlbumState {
  final String errorText;
  AlbumErrorState({required this.errorText});
}

class AlbumLoadingState extends AlbumState {}
