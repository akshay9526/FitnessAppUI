import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      final isValid = _validateEmail(event.email);
      emit(state.copyWith(email: event.email, isEmailValid: isValid));
    });

    on<PasswordChanged>((event, emit) {
      final isValid = _validatePassword(event.password);
      emit(state.copyWith(password: event.password, isPasswordValid: isValid));
    });

    on<LoginSubmitted>((event, emit) {
      final isEmailValid = _validateEmail(state.email);
      final isPasswordValid = _validatePassword(state.password);
      emit(state.copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        formSubmitted: isEmailValid && isPasswordValid,
      ));
    });
  }

  bool _validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }
}
