import 'package:equatable/equatable.dart';
import '../../domain/entity/User.dart';

class AuthModel extends User{
  const AuthModel({
    required super.password,
    required super.email,
    required super.name,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      password:json['password'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'name': name,
      'email': email,
    };
  }

  User toEntity() {
    return User(
      password: password,
      email: email,
      name: name,
    );
  }

}