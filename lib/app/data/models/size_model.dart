import 'dart:convert';

class SizeModel {
  String imperial;
  String metric;

  SizeModel({
    required this.imperial,
    required this.metric,
  });

  Map<String, dynamic> toMap() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }

  factory SizeModel.fromMap(Map<String, dynamic> map) {
    return SizeModel(
      imperial: map['imperial'] ?? '',
      metric: map['metric'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeModel.fromJson(String source) =>
      SizeModel.fromMap(json.decode(source));
}
