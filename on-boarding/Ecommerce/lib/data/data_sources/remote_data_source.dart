import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
 // Future<ProductModel> getProductById(String id);

  deleteProduct(String productId) {}

  getProduct(String productId) {}

  insertProduct(ProductEntity product) {}

  updateProduct(ProductEntity product) {}

  getAllProducts() {}
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});


   @override
  Future<void> deleteProduct(String productId) async {
    final response = await client.delete(Uri.parse(Urls.deleteProduct(productId)));

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String productId) async {
    final response = await client.get(Uri.parse(Urls.getProduct(productId)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> insertProduct(ProductEntity product) async {
    final response = await client.post(
      Uri.parse(Urls.insertProduct()),
      headers: {'Content-Type': 'application/json'},
      body: json.encode((product as ProductModel).toJson()),
    );

    if (response.statusCode != 201) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    final response = await client.put(
      Uri.parse(Urls.updateProduct(product.id)),
      headers: {'Content-Type': 'application/json'},
      body: json.encode((product as ProductModel).toJson()),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(Uri.parse(Urls.getAllProducts()));
print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
