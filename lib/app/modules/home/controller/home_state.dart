part of 'home_controller.dart';

class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateAcceptTravel extends HomeState {}

class HomeStateAcceptedTravel extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<DogsModel>? listDogs;
  final List<CatsModel>? listCats;

  HomeStateLoaded({this.listDogs, this.listCats});

  List<Object> get props => [listDogs!, listCats!];
}

class HomeStateError extends HomeState {}
