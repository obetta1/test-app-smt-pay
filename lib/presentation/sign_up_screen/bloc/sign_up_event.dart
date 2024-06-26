// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SignUpFilled widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SignUpFilled widget is first created.
class SignUpInitialEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the signup is successful.
class GetEmailTokenEvent extends SignUpEvent {
  final String email;

  GetEmailTokenEvent(this.email);
  @override
  List<Object?> get props => [email];
}
