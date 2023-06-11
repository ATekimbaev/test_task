part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsSuccessState extends PostsState {
  final List<PostModel> model;
  PostsSuccessState({required this.model});
}

class PostsErrorState extends PostsState {
  final String errorText;
  PostsErrorState({required this.errorText});
}

class PostsLoadingState extends PostsState {}
