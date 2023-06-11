part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class GetPostsComment extends CommentEvent {
  final int id;
  GetPostsComment({required this.id});
}

class SendCommentEvent extends CommentEvent {
  final String name;
  final String email;
  final String body;
  SendCommentEvent(
      {required this.body, required this.email, required this.name});
}
