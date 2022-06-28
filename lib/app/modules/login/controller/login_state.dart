part of 'login_controller.dart';

class LoginState {
  const LoginState();
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateAcceptTravel extends LoginState {}

class LoginStateAcceptedTravel extends LoginState {}

class LoginStateLoaded extends LoginState {
  bool logged;

  LoginStateLoaded({required this.logged});

  List<Object> get props => [logged];
}

class LoginStateError extends LoginState {}
