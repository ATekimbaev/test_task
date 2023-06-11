import 'package:dio/dio.dart';

import '../../models/comment_model.dart';

class CommentsRepository {
  final Dio dio;
  CommentsRepository({required this.dio});
  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final response = await dio.get('/posts/$postId/comments/');
    final List resultData = response.data;
    return resultData.map((json) => CommentModel.fromJson(json)).toList();
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    await dio.post(
      '/comments/',
      data: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
