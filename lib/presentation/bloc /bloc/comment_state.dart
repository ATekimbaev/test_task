part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentSuccessState extends CommentState {
  final List<CommentModel> model;
  CommentSuccessState({required this.model});
}

class CommentErrorState extends CommentState {
  final String errorText;
  CommentErrorState({required this.errorText});
}

class CommentLoadingState extends CommentState {}

class CommentSendingSuccessState extends CommentState {}
