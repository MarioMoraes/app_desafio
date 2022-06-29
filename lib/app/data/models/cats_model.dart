import 'dart:convert';

import 'package:app_desafio/app/data/models/image_model.dart';
import 'package:app_desafio/app/data/models/size_model.dart';

class CatsModel {
  SizeModel weight;
  String id;
  String name;
  String cfaUrl;
  String vetstreetUrl;
  String vcahospitalsUrl;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String description;
  String lifeSpan;
  int indoor;
  int lap;
  String altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressedTail;
  int shortLegs;
  String wikipediaUrl;
  int hypoallergenic;
  String referenceImageId;
  ImageModel image;

  CatsModel({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'weight': weight.toMap(),
      'id': id,
      'name': name,
      'cfaUrl': cfaUrl,
      'vetstreetUrl': vetstreetUrl,
      'vcahospitalsUrl': vcahospitalsUrl,
      'temperament': temperament,
      'origin': origin,
      'countryCodes': countryCodes,
      'countryCode': countryCode,
      'description': description,
      'lifeSpan': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'altNames': altNames,
      'adaptability': adaptability,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'dogFriendly': dogFriendly,
      'energyLevel': energyLevel,
      'grooming': grooming,
      'healthIssues': healthIssues,
      'intelligence': intelligence,
      'sheddingLevel': sheddingLevel,
      'socialNeeds': socialNeeds,
      'strangerFriendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressedTail': suppressedTail,
      'shortLegs': shortLegs,
      'wikipediaUrl': wikipediaUrl,
      'hypoallergenic': hypoallergenic,
      'referenceImageId': referenceImageId,
      'image': image.toMap(),
    };
  }

  factory CatsModel.fromMap(Map<String, dynamic> map) {
    return CatsModel(
      weight: SizeModel.fromMap(map['weight']),
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      cfaUrl: map['cfa_url'] ?? '',
      vetstreetUrl: map['vetstreet_url'] ?? '',
      vcahospitalsUrl: map['vcahospitals_url'] ?? '',
      temperament: map['temperament'] ?? '',
      origin: map['origin'] ?? '',
      countryCodes: map['country_codes'] ?? '',
      countryCode: map['country_code'] ?? '',
      description: map['description'] ?? '',
      lifeSpan: map['life_span'] ?? '',
      indoor: map['indoor']?.toInt() ?? 0,
      lap: map['lap']?.toInt() ?? 0,
      altNames: map['alt_names'] ?? '',
      adaptability: map['adaptability']?.toInt() ?? 0,
      affectionLevel: map['affection_level']?.toInt() ?? 0,
      childFriendly: map['child_friendly']?.toInt() ?? 0,
      dogFriendly: map['dog_friendly']?.toInt() ?? 0,
      energyLevel: map['energy_level']?.toInt() ?? 0,
      grooming: map['grooming']?.toInt() ?? 0,
      healthIssues: map['health_issues']?.toInt() ?? 0,
      intelligence: map['intelligence']?.toInt() ?? 0,
      sheddingLevel: map['shedding_level']?.toInt() ?? 0,
      socialNeeds: map['social_needs']?.toInt() ?? 0,
      strangerFriendly: map['stranger_friendly']?.toInt() ?? 0,
      vocalisation: map['vocalisation']?.toInt() ?? 0,
      experimental: map['experimental']?.toInt() ?? 0,
      hairless: map['hairless']?.toInt() ?? 0,
      natural: map['natural']?.toInt() ?? 0,
      rare: map['rare']?.toInt() ?? 0,
      rex: map['rex']?.toInt() ?? 0,
      suppressedTail: map['suppressed_tail']?.toInt() ?? 0,
      shortLegs: map['short_legs']?.toInt() ?? 0,
      wikipediaUrl: map['wikipedia_url'] ?? '',
      hypoallergenic: map['hypoallergenic']?.toInt() ?? 0,
      referenceImageId: map['reference_image_id'] ?? '',
      image: ImageModel.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CatsModel.fromJson(String source) =>
      CatsModel.fromMap(json.decode(source));
}
