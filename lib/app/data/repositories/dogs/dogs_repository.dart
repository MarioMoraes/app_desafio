import 'package:app_desafio/app/data/models/dogs_model.dart';

abstract class DogsRepository {
  Future<List<DogsModel>> getBreeds();
}
