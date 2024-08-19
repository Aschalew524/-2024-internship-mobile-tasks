import '../../domain/entities/product.dart';
import '../../domain/entities/productToAddEntity.dart';

class AddModel extends AddEntity {
  const AddModel({
    required super.name,
    required super.description,
    required super.price,
    required super.image,
  });

  factory AddModel.fromJson(Map<String, dynamic> json) {
    return AddModel(
      
      name: json['name'],
      description: json['description'],
      price: json['price'],  
      image: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,  
      'imageUrl': image,
    };
  }

  AddEntity toEntity() => AddEntity(
        name: name,
        description: description,
        price: price,  
        image: image,
      );

  factory AddModel.forLocalJson(Map<String, dynamic> json) {
    return AddModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],  
      image: json['imageUrl'],
    );
  }
}
