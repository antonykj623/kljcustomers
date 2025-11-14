import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../web/authrepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        final data = await authRepository.login(event.phone, event.password);

        if (data["status"] == 1) {
          emit(LoginSuccess(data));
        } else {
          emit(LoginFailure(data["message"] ?? "Invalid login"));
        }
      } catch (e) {
        emit(LoginFailure("Something went wrong: $e"));
      }
    });
  }
}