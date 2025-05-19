import 'dart:convert';

class ConditionModel {
  String test;
  List<String> instructions;

  ConditionModel({
    required this.test,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return {
      'test': test,
      'instructions': instructions,
    };
  }

  factory ConditionModel.fromMap(Map<String, dynamic> map) {
    return ConditionModel(
      test: map['test'],
      instructions: List<String>.from(map['instructions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConditionModel.fromJson(String source) =>
      ConditionModel.fromMap(json.decode(source));
}
