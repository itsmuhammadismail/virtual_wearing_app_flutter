import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name, token, email;

  const User({
    required this.name,
    required this.token,
    required this.email,
  });

  factory User.initial() => const User(
        name: '',
        token: '',
        email: '',
      );

  @override
  List<Object> get props => [name, token, email];

  @override
  bool get stringify => true;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      token: json['token'],
      email: json['email'],
    );
  }
}
