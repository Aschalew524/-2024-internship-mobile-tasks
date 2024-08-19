import 'dart:io';

import 'package:equatable/equatable.dart';

class AddEntity extends Equatable {
  final String name;
  final String description;
  final File image;
  final double price;

  const AddEntity(
      {
      required this.description,
      required this.image,
      required this.name,
      required this.price});

  @override
  List<Object?> get props => [
        name,
        description,
        image,
        price,
      ];
} 