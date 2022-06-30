import 'dart:convert';

class ImageModelCat {
  String id;
  String url;
  int height;
  int width;

  ImageModelCat({
    required this.id,
    required this.url,
    required this.height,
    required this.width,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'height': height,
      'width': width,
    };
  }

  factory ImageModelCat.fromMap(Map<String, dynamic> map) {
    return ImageModelCat(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      height: map['height']?.toInt() ?? 0,
      width: map['width']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModelCat.fromJson(String source) =>
      ImageModelCat.fromMap(json.decode(source));
}
