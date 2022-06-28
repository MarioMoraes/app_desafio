import 'dart:convert';

import 'package:app_desafio/app/data/models/image_model.dart';
import 'package:app_desafio/app/data/models/size_model.dart';

class BreedModel {
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
  ImageModel image;

  BreedModel({
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

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
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
      image: ImageModel.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMap(json.decode(source));
}
