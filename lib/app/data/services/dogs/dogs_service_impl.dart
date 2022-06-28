import 'dart:developer';

import 'package:app_desafio/app/data/models/breed_model.dart';
import 'package:dio/dio.dart';

import './dogs_service.dart';

class DogsServiceImpl implements DogsService {
  final Dio _dio = Dio();

  @override
  Future<List<BreedModel>> getBreeds() async {
    try {
      final response = await _dio.get('https://api.thedogapi.com/v1/breeds');

      final listBreed = await response.data
          .map<BreedModel>((e) => BreedModel.fromMap(e))
          .toList();
      return listBreed;
    } on DioError catch (e, s) {
      log('Erro Endpoint Breed', error: e, stackTrace: s);
      return [];
    }
  }
}
