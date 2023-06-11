import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/album_model.dart';
import '../../../data/models/album_model_with_photos.dart';
import '../../../data/services/repositories/album_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<GetAlbumEvent>(
      (event, emit) async {
        emit(
          AlbumLoadingState(),
        );

        try {
          final model = await repository.getAllAlbums();
          emit(AlbumSuccessState(model: model));
        } catch (e) {
          emit(
            AlbumErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
    on<GetUsersAlbums>(
      (event, emit) async {
        emit(
          AlbumLoadingState(),
        );

        try {
          final model = await repository.getAlbumsByUserIdWithPhotos(event.id);
          emit(UsersAlbumsSuccessState(model: model));
        } catch (e) {
          emit(
            AlbumErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
  final AlbumRepository repository;
}
