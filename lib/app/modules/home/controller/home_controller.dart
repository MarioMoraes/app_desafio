import 'dart:developer';

import 'package:app_desafio/app/data/models/dogs_model.dart';
import 'package:app_desafio/app/data/repositories/dogs/dogs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final DogsRepository _dogsRepository;

  HomeController({required DogsRepository dogsRepository})
      : _dogsRepository = dogsRepository,
        super(HomeStateInitial());

  Future<void> getAll() async {
    try {
      emit(HomeStateLoading());
      var list = await _dogsRepository.getBreeds();
      emit(HomeStateLoaded(listBreed: list));
    } catch (e, s) {
      log('Erro na API', error: e, stackTrace: s);
      emit(HomeStateError());
    }
  }
}
