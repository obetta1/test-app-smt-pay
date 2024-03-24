import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
part 'create_pin_event.dart';
part 'create_pin_state.dart';

/// A bloc that manages the state of a CreatePin according to the event that is dispatched to it.
class CreatePinBloc extends Bloc<CreatePinEvent, CreatePinState> {
  CreatePinBloc(CreatePinState initialState) : super(initialState) {
    on<CreatePinInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CreatePinInitialEvent event,
    Emitter<CreatePinState> emit,
  ) async {}
}
