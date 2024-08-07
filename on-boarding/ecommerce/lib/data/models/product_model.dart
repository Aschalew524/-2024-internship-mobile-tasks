import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String name,
    required String description,
    required int price,
    required String imageUrl,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          imageUrl: imageUrl,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
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

abstract class ProductLocalDataSource {
  Future<ProductModel?> getProductById(String id);
  Future<void> insertProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ProductModel?> getProductById(String id) async {
    final jsonString = sharedPreferences.getString(id);
    if (jsonString != null) {
      return ProductModel.forLocalJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> deleteProduct(String id) async {
    await sharedPreferences.remove(id);
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    await sharedPreferences.setString(product.id, json.encode(product.toJson()));
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await sharedPreferences.setString(product.id, json.encode(product.toJson()));
  }
}