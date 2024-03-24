// ignore_for_file: must_be_immutable

part of 'otp_authentication_bloc.dart';

/// Represents the state of OtpAuthentication in the application.
abstract class OtpAuthenticationState extends Equatable {
  TextEditingController? otpController;

  OtpAuthenticationState({
    this.otpController,
  });

  @override
  List<Object?> get props => [];

  OtpAuthenticationState copyWith(
      {required TextEditingController otpController}) {
    return InitOtpAuthenticationState(
      otpController: otpController ?? this.otpController,
    );
  }
}

class OptLoadingState extends OtpAuthenticationState {}

class InitOtpAuthenticationState extends OtpAuthenticationState {
  InitOtpAuthenticationState({
    this.otpController,
  });

  TextEditingController? otpController;

  @override
  List<Object?> get props => [
        otpController,
      ];

  OtpAuthenticationState copyWith({
    TextEditingController? otpController,
  }) {
    return InitOtpAuthenticationState(
      otpController: otpController ?? this.otpController,
    );
  }
}

class OtpSuccessState extends OtpAuthenticationState {
  final OtpResponse? email;

  OtpSuccessState(this.email);

  @override
  List<Object?> get props => [email];
}

class OtpErrorState extends OtpAuthenticationState {
  final String? errorMessage;

  OtpErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
