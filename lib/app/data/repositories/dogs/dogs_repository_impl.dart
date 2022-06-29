import 'package:app_desafio/app/data/models/dogs_model.dart';
import 'package:app_desafio/app/data/services/dogs/dogs_service.dart';

import './dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  final DogsService _dogsService;

  DogsRepositoryImpl({
    required DogsService dogsService,
  }) : _dogsService = dogsService;

  @override
  Future<List<DogsModel>> getBreeds() async {
    final data = await _dogsService.getBreeds();
    return data;
  }
}
