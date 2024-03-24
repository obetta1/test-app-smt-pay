// ignore_for_file: must_be_immutable

part of 'verify_id_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///IdFill widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class VerifyIdEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the IdFill widget is first created.
class VerifyIdInitialEvent extends VerifyIdEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends VerifyIdEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class RegisterUserEvent extends VerifyIdEvent {
  final RegisterRequestModel registerRequestModel;

  RegisterUserEvent(this.registerRequestModel);

  @override
  List<Object?> get props => [registerRequestModel];
}
