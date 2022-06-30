import 'dart:convert';

class ImageModelDog {
  String id;
  String url;
  int height;
  int weight;

  ImageModelDog({
    required this.id,
    required this.url,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'height': height,
      'weight': weight,
    };
  }

  factory ImageModelDog.fromMap(Map<String, dynamic> map) {
    return ImageModelDog(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModelDog.fromJson(String source) =>
      ImageModelDog.fromMap(json.decode(source));
}
