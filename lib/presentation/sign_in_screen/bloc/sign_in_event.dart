// ignore_for_file: must_be_immutable

part of 'sign_in_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SignInFilled widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SignInFilled widget is first created.
class InitLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class UserLogInEvent extends LoginEvent {
  final String email;
  final String password;

  UserLogInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
