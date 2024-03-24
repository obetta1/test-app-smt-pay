// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OtpAuthentication widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OtpAuthentication widget is first created.
class DashboardInitialEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class GetSecretEvent extends DashboardEvent {
  GetSecretEvent();

  @override
  List<Object?> get props => [];
}
