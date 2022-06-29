import 'package:app_desafio/app/data/models/cats_model.dart';

import '../../models/dogs_model.dart';

abstract class BreedsService {
  Future<List<DogsModel>> getDogs();
  Future<List<CatsModel>> getCats();
}
