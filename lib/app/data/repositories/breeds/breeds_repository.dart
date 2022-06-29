import 'package:app_desafio/app/data/models/cats_model.dart';
import 'package:app_desafio/app/data/models/dogs_model.dart';

abstract class BreedsRepository {
  Future<List<DogsModel>> getDogs();
  Future<List<CatsModel>> getCats();
}
