import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/error/exception.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/productToAddEntity.dart';
import '../models/product_model.dart';
import 'package:mime/mime.dart';

abstract class ProductRemoteDataSource {
 // Future<ProductModel> getProductById(String id);

  deleteProduct(String productId) {}

  getProduct(String productId) {}

  insertProduct(AddEntity product) {}

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
  Future<void> insertProduct(AddEntity product) async {
    /* final response = await client.post(
      Uri.parse(Urls.insertProduct()),
      headers: {'Content-Type': 'application/json'},
      body: json.encode((product as ProductModel).toJson()),
    );

    if (response.statusCode != 201) {
      throw ServerException();
    } */

        print(product);

      var request =  http.MultipartRequest('POST', Uri.parse(Urls.insertProduct()));
      request.fields['name'] = product.name;
      request.fields['price'] = product.price.toString();
      request.fields['description'] = product.description;
      request.files.add(await http.MultipartFile.fromPath(
        'image', 
        product.image.path,
        contentType: MediaType('image','jpg')));

        final response = await request.send();
        print(response.statusCode);
        if (response.statusCode == 201){
          print('product created');

        }
        else{
          print('product not created');
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

  if (response.statusCode == 200) {
    print('Response Body: ${response.body}');
    final data = json.decode(response.body);

    // The response is a Map with a 'data' key containing the list of products
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      final productList = data['data'] as List<dynamic>;
      return productList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  } else {
    throw ServerException();
  }
}

}
