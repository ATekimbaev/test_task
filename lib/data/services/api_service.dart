import 'dart:convert';

import '../models/album_model.dart';
import '../models/comment_model.dart';
import '../models/photo_model.dart';
import '../models/post_model.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  // static Future<List<PhotoModel>> getAllPhotos() async {
  //   const url = '$baseUrl/photos/';
  //   final response = await http.get(Uri.parse(url));
  //   final jsonResponse =
  //       List<Map<String, dynamic>>.from(json.decode(response.body) as List);
  //   return jsonResponse.map(PhotoModel.fromMap).toList();
  // }

  // static Future<List<CommentModel>> getAllComments() async {
  //   const url = '$baseUrl/comments/';
  //   final response = await http.get(Uri.parse(url));
  //   final jsonResponse =
  //       List<Map<String, dynamic>>.from(json.decode(response.body) as List);
  //   return jsonResponse.map(CommentModel.fromMap).toList();
  // }

  // static Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
  //   final url = '$baseUrl/user/$userId/albums';
  //   final response = await http.get(Uri.parse(url));
  //   final jsonResponse =
  //       List<Map<String, dynamic>>.from(json.decode(response.body) as List);
  //   return jsonResponse.map(AlbumModel.fromMap).toList();
  // }

  // static Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
  //   final url = '$baseUrl/albums/$albumId/photos/';
  //   final response = await http.get(Uri.parse(url));
  //   final jsonResponse =
  //       List<Map<String, dynamic>>.from(json.decode(response.body) as List);
  //   return jsonResponse.map(PhotoModel.fromMap).toList();
  // }
}
