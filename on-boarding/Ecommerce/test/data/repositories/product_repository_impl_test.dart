import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_7/core/error/exception.dart';
import 'package:task_7/core/error/failure.dart';
import 'package:task_7/data/models/product_model.dart';
import 'package:task_7/data/repositories/product_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductRepositoryImpl productRepositoryImpl;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImpl = ProductRepositoryImpl(
      productRemoteDataSource: mockProductRemoteDataSource,
    );
  });

  const testProductModel = ProductModel(
    id: '1',
    name: 'shoes',
    description: 'men/s shoes',
    price: 123,
    imageUrl: 'http',   
  );

  const testProductEntity = ProductModel(
    id: '1',
    name: 'shoes',
    description: 'men/s shoes',
    price: 123,
    imageUrl: 'http',
  );

  const testProductId = '1';

  group('Repository Implementation Group', () {
    test('should return ProductEntity when the call to data source is successful', () async {
      // arrange
      when(mockProductRemoteDataSource.getProductById(testProductId))
          .thenAnswer((_) async => testProductModel);

      // act
      final result = await productRepositoryImpl.getProduct(testProductId);

      // assert
      expect(result, equals(Right(testProductEntity)));
    });

    test('should return server failure when a call to data source is unsuccessful', () async {
      // arrange
      when(mockProductRemoteDataSource.getProductById(testProductId))
          .thenThrow(ServerException());

      // act
      final result = await productRepositoryImpl.getProduct(testProductId);

      // assert
      expect(result, equals(Left(ServerFailure('An error has occurred'))));
    });

    test('should return connection failure when the device has no internet', () async {
      // arrange
      when(mockProductRemoteDataSource.getProductById(testProductId))
          .thenThrow(const SocketException('Failed to connect to the network'));

      // act
      final result = await productRepositoryImpl.getProduct(testProductId);

      // assert
      expect(result, equals(const Left(NetworkFailure('Failed to connect to the network'))));
    });
  });
}
