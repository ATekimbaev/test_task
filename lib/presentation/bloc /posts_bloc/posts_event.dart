part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class GetPostsEvent extends PostsEvent {}

class GetUsersPostsEvent extends PostsEvent {
  final int id;
  GetUsersPostsEvent({required this.id});
}
