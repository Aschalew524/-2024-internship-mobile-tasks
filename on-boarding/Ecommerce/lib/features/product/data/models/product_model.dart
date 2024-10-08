import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(), 
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,  
      'imageUrl': imageUrl,
    };
  }

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        description: description,
        price: price,  
        imageUrl: imageUrl,
      );

  factory ProductModel.forLocalJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],  
      imageUrl: json['imageUrl'],
    );
  }
}
