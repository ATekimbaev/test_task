import 'package:dio/dio.dart';

import '../../models/album_model.dart';
import '../../models/album_model_with_photos.dart';

class AlbumRepository {
  final Dio dio;
  AlbumRepository({required this.dio});

  Future<List<AlbumModel>> getAllAlbums() async {
    final response = await dio.get('albums');
    final List resultData = response.data;
    return resultData.map((json) => AlbumModel.fromJson(json)).toList();
  }

  Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final response = await dio.get('/user/$userId/albums?_embed=photos');

    final List resultData = response.data;
    return resultData
        .map((json) => AlbumModelWithPhotos.fromJson(json))
        .toList();
  }
}
