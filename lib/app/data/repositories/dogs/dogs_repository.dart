import 'package:app_desafio/app/data/models/breed_model.dart';

abstract class DogsRepository {
  Future<List<BreedModel>> getBreeds();
}
