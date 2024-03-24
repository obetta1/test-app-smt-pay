import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/models/dashboard_response.dart';
import 'package:smart_pay_app/domain/usecase/get_secret_usecase.dart';
import '../../../domain/usecase/verify_email_usecase.dart';
import '../../otp_authentication_screen/models/otp_response.dart';
import '/core/app_export.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a OtpAuthentication according to the event that is dispatched to it.
class DashBoardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardSecretUseCase getDashboardSecretUseCase;
  DashBoardBloc(InitDashboardState initialState, this.getDashboardSecretUseCase)
      : super(initialState) {
    on<DashboardInitialEvent>(_mapItem);
    on<GetSecretEvent>(_showDashboardSecret);
  }

  List<String> secretList = [];
  _showDashboardSecret(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoadingState());
      final secret = await getDashboardSecretUseCase.execute();
      secretList.add(secret.secret!);
      emit(DashboardLoadedState(secret, secretList));
    } catch (e) {
      emit(DashboardErrorState(e.toString()));
    }
  }

  FutureOr<void> _mapItem(
      DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoadingState());
      final secret = await getDashboardSecretUseCase.execute();
      secretList.add(secret.secret!);
      emit(DashboardLoadedState(secret, secretList));
    } catch (e) {
      emit(DashboardErrorState(e.toString()));
    }
  }
}
