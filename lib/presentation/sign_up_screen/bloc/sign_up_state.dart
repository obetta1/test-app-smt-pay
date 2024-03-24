// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUpFilled in the application.
abstract class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object?> get props => [];
}

class SignUpLoading extends SignUpState {}

class SignUpInitialState extends SignUpState {
  SignUpInitialState({
    this.emailController,
    this.signUpFilledModelObj,
  });

  TextEditingController? emailController;

  SignUpFilledModel? signUpFilledModelObj;

  @override
  List<Object?> get props => [
        emailController,
        signUpFilledModelObj,
      ];

  SignUpInitialState copyWith({
    TextEditingController? emailController,
    SignUpFilledModel? signUpFilledModelObj,
  }) {
    return SignUpInitialState(
      emailController: emailController ?? this.emailController,
      signUpFilledModelObj: signUpFilledModelObj ?? this.signUpFilledModelObj,
    );
  }
}

class SignUpSuccessState extends SignUpState {
  final String? tokenResponse;

  const SignUpSuccessState(this.tokenResponse);

  @override
  List<Object?> get props => [tokenResponse];
}

class SignUpErrorState extends SignUpState {
  final String? errorMessage;

  const SignUpErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
