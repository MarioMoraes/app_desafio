import 'package:app_desafio/app/data/models/cats_model.dart';
import 'package:app_desafio/app/data/models/dogs_model.dart';
import 'package:app_desafio/app/data/services/breeds/breeds_service.dart';

import 'breeds_repository.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedsService _service;

  BreedsRepositoryImpl({
    required BreedsService service,
  }) : _service = service;

  @override
  Future<List<DogsModel>> getDogs() async {
    final data = await _service.getDogs();
    return data;
  }

  @override
  Future<List<CatsModel>> getCats() async {
    final data = await _service.getCats();
    return data;
  }
}
