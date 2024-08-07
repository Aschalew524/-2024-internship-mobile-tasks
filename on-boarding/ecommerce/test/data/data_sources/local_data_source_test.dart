import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_7/core/error/exception.dart';
import 'package:task_7/data/data_sources/local_data_source.dart';
import 'package:task_7/data/models/product_model.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ProductLocalDataSourceImpl productLocalDataSourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    productLocalDataSourceImpl = ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getCachedProducts', () {
    test('should return a list of product model', () async {
      // arrange
      final productJson = jsonEncode({
        'id': '1',
        'name': 'shoes',
        'description': 'men/s shoes',
        'price': 120,
        'imageUrl': 'http',
      });
      when(mockSharedPreferences.getStringList('cachedProduct'))
          .thenReturn([productJson]);

      // act
      final result = await productLocalDataSourceImpl.getCachedProducts();

      // assert
      expect(result, isA<List<ProductModel>>());
      expect(result.length, 1);
      expect(result.first.id, '1');
      expect(result.first.name, 'shoes');
      expect(result.first.description, 'men/s shoes');
      expect(result.first.price, 120);
      expect(result.first.imageUrl, 'http');
    });

    test('should throw a CacheException when there is no cached value', () async {
      // arrange
      when(mockSharedPreferences.getStringList('cachedProduct'))
          .thenReturn(null);

      // act
      final call = productLocalDataSourceImpl.getCachedProducts;

      // assert
      expect(() async => await call(), throwsA(isA<CacheException>()));
    });
  });
}
