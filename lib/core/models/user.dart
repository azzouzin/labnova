// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String uid;
  final String? name;
  final String? avatarUrl;

  User({required this.uid, required this.name, required this.avatarUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String?,
      avatarUrl: map['avatarUrl'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<User> fakeUsers = [
  User(
      uid: '1',
      name: 'Azzouz Bouhssina',
      avatarUrl: 'https://ui-avatars.com/api/?name=Alice+Johnson '),
  User(
      uid: '2',
      name: 'Ben jeddi Mohammed',
      avatarUrl: 'https://ui-avatars.com/api/?name=Bob+Smith '),
  User(
      uid: '3',
      name: 'Amin Mokhtari',
      avatarUrl: 'https://ui-avatars.com/api/?name=Charlie+Brown '),
];
