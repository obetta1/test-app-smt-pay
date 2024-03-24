// ignore_for_file: must_be_immutable

part of 'verify_id_bloc.dart';

/// Represents the state of IdFill in the application.
class VerifyIdState extends Equatable {
  VerifyIdState({
    this.nameController,
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        passwordController,
        isShowPassword,
      ];

  VerifyIdState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
  }) {
    return VerifyIdState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }
}

class VerifyIdLoadingState extends VerifyIdState {}

class VerifyIdSuccessState extends VerifyIdState {
  final RegisterResponse registerResponse;

  VerifyIdSuccessState(this.registerResponse);

  @override
  List<Object?> get props => [registerResponse];
}

class IdentityErrorState extends VerifyIdState {
  final String error;

  IdentityErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
