part of 'home_controller.dart';

class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateAcceptTravel extends HomeState {}

class HomeStateAcceptedTravel extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<DogsModel> listBreed;

  HomeStateLoaded({required this.listBreed});

  List<Object> get props => [listBreed];
}

class HomeStateError extends HomeState {}
