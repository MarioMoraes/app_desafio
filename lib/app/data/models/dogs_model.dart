import 'dart:convert';

import 'package:app_desafio/app/data/models/image_model_dog.dart';
import 'package:app_desafio/app/data/models/size_model.dart';

class DogsModel {
  int id;
  String name;
  String bredFor;
  String breedGroup;
  String lifeSpan;
  String temperament;
  String origin;
  String referenceImageId;
  SizeModel weight;
  SizeModel height;
  ImageModelDog image;

  DogsModel({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
    required this.weight,
    required this.height,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'bredFor': bredFor,
      'breedGroup': breedGroup,
      'lifeSpan': lifeSpan,
      'temperament': temperament,
      'origin': origin,
      'referenceImageId': referenceImageId,
      'weight': weight.toMap(),
      'height': height.toMap(),
      'image': image.toMap(),
    };
  }

  factory DogsModel.fromMap(Map<String, dynamic> map) {
    return DogsModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      bredFor: map['bred_for'] ?? '',
      breedGroup: map['breed_group'] ?? '',
      lifeSpan: map['life_span'] ?? '',
      temperament: map['temperament'] ?? '',
      origin: map['origin'] ?? '',
      referenceImageId: map['reference_image_id'] ?? '',
      weight: SizeModel.fromMap(map['weight']),
      height: SizeModel.fromMap(map['height']),
      image: ImageModelDog.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DogsModel.fromJson(String source) =>
      DogsModel.fromMap(json.decode(source));
}
