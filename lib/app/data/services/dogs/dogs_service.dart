import '../../models/breed_model.dart';

abstract class DogsService {
  Future<List<BreedModel>> getBreeds();
}
