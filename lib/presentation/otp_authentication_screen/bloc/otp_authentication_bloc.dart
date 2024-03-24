import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecase/verify_email_usecase.dart';
import '../models/otp_response.dart';
import '/core/app_export.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'otp_authentication_event.dart';
part 'otp_authentication_state.dart';

/// A bloc that manages the state of a OtpAuthentication according to the event that is dispatched to it.
class OtpAuthenticationBloc
    extends Bloc<OtpAuthenticationEvent, OtpAuthenticationState>
    with CodeAutoFill {
  final VerifyEmailUseCAse verifyEmailUseCAse;
  OtpAuthenticationBloc(
      InitOtpAuthenticationState initialState, this.verifyEmailUseCAse)
      : super(initialState) {
    on<OtpAuthenticationInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
    on<VerifyOtpEvent>(_verifyOtp);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<OtpAuthenticationState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    OtpAuthenticationInitialEvent event,
    Emitter<OtpAuthenticationState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }

  _verifyOtp(VerifyOtpEvent event, Emitter<OtpAuthenticationState> emit) async {
    try {
      emit(OptLoadingState());
      final token = await verifyEmailUseCAse.execute(event.email, event.token);
      emit(OtpSuccessState(token));
      NavigatorService.pushNamed(
        AppRoutes.idFillScreen,
      );
    } catch (e) {
      emit(OtpErrorState(e.toString()));
    }
  }
}
