// ignore_for_file: must_be_immutable

part of 'create_pin_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CreatePin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreatePinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the CreatePin widget is first created.
class CreatePinInitialEvent extends CreatePinEvent {
  @override
  List<Object?> get props => [];
}
