import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/comment_model.dart';
import '../../../data/services/repositories/commetns_repository.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({required this.repository}) : super(CommentInitial()) {
    on<GetPostsComment>(
      (event, emit) async {
        emit(CommentLoadingState());
        try {
          final model = await repository.getCommentsByPostId(event.id);
          emit(
            CommentSuccessState(model: model),
          );
        } catch (e) {
          emit(
            CommentErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
    on<SendCommentEvent>(
      (event, emit) async {
        emit(CommentLoadingState());
        try {
          await repository.sendComment(
              name: event.name, body: event.body, email: event.email);
          emit(
            CommentSendingSuccessState(),
          );
        } catch (e) {
          emit(
            CommentErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
  final CommentsRepository repository;
}
