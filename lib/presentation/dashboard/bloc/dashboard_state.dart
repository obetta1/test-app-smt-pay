// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

/// Represents the state of OtpAuthentication in the application.
abstract class DashboardState extends Equatable {
  DashboardState();

  @override
  List<Object?> get props => [];
}

class InitDashboardState extends DashboardState {
  InitDashboardState();
  @override
  List<Object?> get props => [];
}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  final DashBoardResponse? secret;
  final List<String> secretList;

  DashboardLoadedState(this.secret, this.secretList);

  @override
  List<Object?> get props => [secret];
}

class DashboardErrorState extends DashboardState {
  final String? errorMessage;

  DashboardErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
