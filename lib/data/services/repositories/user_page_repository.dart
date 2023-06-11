import 'package:dio/dio.dart';
import 'package:test_task/data/models/user_model.dart';

class UserPageRepository {
  final Dio dio;
  UserPageRepository({required this.dio});

  Future<List<UserModel>> getAllUsers() async {
    final response = await dio.get('/users/');

    final List resultData = response.data;

    return resultData.map((json) => UserModel.fromJson(json)).toList();
  }
}
