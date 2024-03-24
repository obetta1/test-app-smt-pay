// ignore_for_file: must_be_immutable

part of 'otp_authentication_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OtpAuthentication widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OtpAuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OtpAuthentication widget is first created.
class OtpAuthenticationInitialEvent extends OtpAuthenticationEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends OtpAuthenticationEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}

class VerifyOtpEvent extends OtpAuthenticationEvent {
  final String email;
  final String token;

  VerifyOtpEvent(this.email, this.token);

  @override
  List<Object?> get props => [email, token];
}
