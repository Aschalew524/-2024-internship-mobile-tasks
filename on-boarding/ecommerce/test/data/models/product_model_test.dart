import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/domain/entities/product.dart';
import '../../../lib/features/product/models/product_model.dart';
import 'helpers/dummy_data/json_reader.dart';

void main() {
  const testProductModel = ProductModel(
    id: '1',
    name: 'shoe',
    description: 'men/s shoes',
    price: 120,
    imageUrl: 'http',
  );

  test(
    'should be a subclass of Product entity',
    () {
      expect(testProductModel, isA<Product>());
    },
  );

  test('should return a valid model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_product_data.json'));

    // act
    final result = ProductModel.fromJson(jsonMap);

    // expect
    expect(result, equals(testProductModel));
  });

  test('should return valid json data', () {
    // act
    final result = testProductModel.toJson();
    final expectedJsonMap = {
      'id': '1',
      'name': 'shoe',
      'description': 'men/s shoes',
      'price': 120,
      'imageUrl': 'http'
    };

    // expect
    expect(result, equals(expectedJsonMap));
  });

}