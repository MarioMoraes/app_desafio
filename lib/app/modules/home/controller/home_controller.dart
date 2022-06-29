import 'dart:developer';

import 'package:app_desafio/app/data/models/cats_model.dart';
import 'package:app_desafio/app/data/models/dogs_model.dart';
import 'package:app_desafio/app/data/repositories/breeds/breeds_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final BreedsRepository _breedsRepository;

  HomeController({required BreedsRepository breedsRepository})
      : _breedsRepository = breedsRepository,
        super(HomeStateInitial());

  Future<void> getAll() async {
    try {
      emit(HomeStateLoading());
      var listDogs = await _breedsRepository.getDogs();
      emit(HomeStateLoaded(listDogs: listDogs));
    } catch (e, s) {
      log('Erro na API', error: e, stackTrace: s);
      emit(HomeStateError());
    }
  }
}
