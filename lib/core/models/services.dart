import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServicesModel {
  final int id;
  final String name;
  final String image;
  const ServicesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) =>
      ServicesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
