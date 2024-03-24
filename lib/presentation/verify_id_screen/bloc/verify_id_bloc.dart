import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecase/verify_identity_usecase.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '/core/app_export.dart';
part 'verify_id_event.dart';
part 'verify_id_state.dart';

/// A bloc that manages the state of a IdFill according to the event that is dispatched to it.
class VerifyIdBloc extends Bloc<VerifyIdEvent, VerifyIdState> {
  final VerifyIdentityUseCase verifyIdentityUseCase;
  final BuildContext context;
  VerifyIdBloc(
      VerifyIdState initialState, this.verifyIdentityUseCase, this.context)
      : super(initialState) {
    on<VerifyIdInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<RegisterUserEvent>(_verifyIdentity);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<VerifyIdState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    VerifyIdInitialEvent event,
    Emitter<VerifyIdState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true));
  }

  _verifyIdentity(RegisterUserEvent event, Emitter<VerifyIdState> emit) async {
    var pref = PrefUtils();
    try {
      emit(VerifyIdLoadingState());
      final registerResponse =
          await verifyIdentityUseCase.execute(event.registerRequestModel);
      emit(VerifyIdSuccessState(registerResponse));
      pref.saveUsername(registerResponse.user!.fullName!);
      onTapContinue();
    } catch (e) {
      emit(IdentityErrorState(e.toString()));
      showSnackBar(
          context, "Server error , please try again later");
    }
  }

  /// Navigates to the createPinScreen when the action is triggered.
  onTapContinue() {
    NavigatorService.pushNamed(
      AppRoutes.createPinScreen,
    );
  }
}
