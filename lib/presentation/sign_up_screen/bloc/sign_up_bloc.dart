import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/models/email_token_response.dart';
import '../../../domain/usecase/get_email_token_usecase.dart';
import '/core/app_export.dart';
import 'package:smart_pay_app/presentation/sign_up_screen/models/sign_up_filled_model.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final GetEmailUseCase getEmailUseCase;
  final BuildContext context;
  SignUpBloc(
      SignUpInitialState initialState, this.getEmailUseCase, this.context)
      : super(initialState) {
    on<SignUpInitialEvent>(_initSignup);
    on<GetEmailTokenEvent>(_getEmailToken);
  }

  void _getEmailToken(
    GetEmailTokenEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(SignUpLoading());
      final token = await getEmailUseCase.execute(event.email);
      var pref = PrefUtils();
      pref.saveToken(token!);
      emit(SignUpSuccessState(token!));
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
      showSnackBar(context, "Server error , please try again later");
    }
  }

  FutureOr<void> _initSignup(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {}
}
