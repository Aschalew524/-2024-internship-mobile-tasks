import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_7/core/constants/constants.dart';
import 'package:task_7/core/error/exception.dart';
import 'package:task_7/data/models/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(Urls.getProduct(id)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}