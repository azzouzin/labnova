class User {
  final String id;
  final String name;
  final String avatarUrl;

  User({required this.id, required this.name, required this.avatarUrl});
}

List<User> fakeUsers = [
  User(
      id: '1',
      name: 'Azzouz Bouhssina',
      avatarUrl: 'https://ui-avatars.com/api/?name=Alice+Johnson '),
  User(
      id: '2',
      name: 'Ben jeddi Mohammed',
      avatarUrl: 'https://ui-avatars.com/api/?name=Bob+Smith '),
  User(
      id: '3',
      name: 'Amin Mokhtari',
      avatarUrl: 'https://ui-avatars.com/api/?name=Charlie+Brown '),
];
