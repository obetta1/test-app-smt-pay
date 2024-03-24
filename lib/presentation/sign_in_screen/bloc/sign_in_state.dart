// ignore_for_file: must_be_immutable

part of 'sign_in_bloc.dart';

/// Represents the state of SignInFilled in the application.

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {}

class InitLoginState extends LoginState {
  InitLoginState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.signInFilledModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignInFilledModel? signInFilledModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        signInFilledModelObj,
      ];

  InitLoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    SignInFilledModel? signInFilledModelObj,
  }) {
    return InitLoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signInFilledModelObj: signInFilledModelObj ?? this.signInFilledModelObj,
    );
  }
}

class LoginSuccessState extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccessState(this.loginResponse);

  @override
  List<Object?> get props => [loginResponse];
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
