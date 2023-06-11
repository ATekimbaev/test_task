import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/services/repositories/user_page_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.repository}) : super(UserInitial()) {
    on<GetUsersEvent>(
      (event, emit) async {
        emit(
          UserLoadingState(),
        );

        try {
          final model = await repository.getAllUsers();
          emit(UserSuccessState(model: model));
        } catch (e) {
          emit(
            UserErrorState(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
  final UserPageRepository repository;
}
