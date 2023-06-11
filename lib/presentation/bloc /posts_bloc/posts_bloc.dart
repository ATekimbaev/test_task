import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/data/models/post_model.dart';
import 'package:test_task/data/services/repositories/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.repository}) : super(PostsInitial()) {
    on<GetPostsEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        final model = await repository.getAllPosts();
        emit(
          PostsSuccessState(model: model),
        );
      } catch (e) {
        emit(
          PostsErrorState(
            errorText: e.toString(),
          ),
        );
      }
    });
    on<GetUsersPostsEvent>(
      (event, emit) async {
        emit(PostsLoadingState());
        try {
          final model = await repository.getPostsByUserId(event.id);
          emit(
            PostsSuccessState(model: model),
          );
        } catch (e) {
          emit(
            PostsErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
  final PostRepository repository;
}
