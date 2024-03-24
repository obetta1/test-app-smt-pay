import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/models/login_response.dart';
import '../../../domain/usecase/login_usecase.dart';
import '/core/app_export.dart';
import 'package:smart_pay_app/presentation/sign_in_screen/models/sign_in_filled_model.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// A bloc that manages the state of a SignInFilled according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final BuildContext context;
  LoginBloc(InitLoginState initialState, this.loginUseCase, this.context)
      : super(initialState) {
    on<InitLoginEvent>(_initLogin);
    on<UserLogInEvent>((event, state) async {
      await _loginButteonClicked(event, state);
    });
  }

  _loginButteonClicked(UserLogInEvent event, Emitter<LoginState> emit) async {
    var pref = PrefUtils();
    try {
      emit(LoginLoading());
      final loginResponse =
          await loginUseCase.execute(event.email, event.password);
      print("request body=========${loginResponse.toJson()}");

      emit(LoginSuccessState(
        loginResponse,
      ));
      pref.saveAccessToken(loginResponse.token!);
      NavigatorService.pushNamed(AppRoutes.dashboardScreen);
    } catch (e) {
      emit(LoginErrorState(e.toString()));
      showSnackBar(
          context, "Failed to login: Invalid Email Or Password'");
    }
  }

  FutureOr<void> _initLogin(InitLoginEvent event, Emitter<LoginState> emit) {}
}
