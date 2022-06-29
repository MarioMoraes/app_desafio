import 'dart:developer';

import 'package:app_desafio/app/data/models/cats_model.dart';
import 'package:app_desafio/app/data/models/dogs_model.dart';
import 'package:dio/dio.dart';

import 'breeds_service.dart';

class BreedsServiceImpl implements BreedsService {
  final Dio _dio = Dio();

  @override
  Future<List<DogsModel>> getDogs() async {
    try {
      final response = await _dio.get('https://api.thedogapi.com/v1/breeds');

      final listBreed = await response.data
          .map<DogsModel>((e) => DogsModel.fromMap(e))
          .toList();
      return listBreed;
    } on DioError catch (e, s) {
      log('Erro Endpoint Dogs', error: e, stackTrace: s);
      return [];
    }
  }

  @override
  Future<List<CatsModel>> getCats() async {
    return [];
  }
}
