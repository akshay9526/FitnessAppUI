part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool formSubmitted;

  LoginState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.formSubmitted,
  });

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isEmailValid: true,
      isPasswordValid: true,
      formSubmitted: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? formSubmitted,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      formSubmitted: formSubmitted ?? false,
    );
  }
}
