import '../../models/dogs_model.dart';

abstract class DogsService {
  Future<List<DogsModel>> getBreeds();
}
