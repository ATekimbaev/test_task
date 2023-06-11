import 'package:dio/dio.dart';

import '../../models/post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository({required this.dio});

  Future<List<PostModel>> getAllPosts() async {
    final response = await dio.get('/posts/');
    final List resultData = response.data;
    return resultData.map((json) => PostModel.fromJson(json)).toList();
  }

  Future<List<PostModel>> getPostsByUserId(int userId) async {
    final response = await dio.get('/user/$userId/posts');
    final List resultData = response.data;
    return resultData.map((json) => PostModel.fromJson(json)).toList();
  }
}
