import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LaboModel {
  final int id;
  final String name;
  final List<String> parameters;
  const LaboModel({
    required this.id,
    required this.name,
    required this.parameters,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parameters': parameters,
    };
  }

  factory LaboModel.fromMap(Map<String, dynamic> map) {
    return LaboModel(
      id: map['id'] as int,
      name: map['name'] as String,
      parameters: List<String>.from(
        (map['parameters'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LaboModel.fromJson(String source) =>
      LaboModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
