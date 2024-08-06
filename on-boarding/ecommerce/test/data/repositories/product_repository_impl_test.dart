// Mock classes
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_7/core/error/exception.dart';
import 'package:task_7/core/error/failure.dart';
import 'package:task_7/core/network/network_info.dart';
import 'package:task_7/data/repositories/product_repository_impl.dart';
import 'package:task_7/domain/entities/product.dart';

import '../data_sources/remote_data_source_test.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}
class MockLocalDataSource extends Mock implements ProductLocalDataSource {}
class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const testProductModel = ProductEntity(
    id: '1',
    name: 'shoes',
    description: 'men/s shoes',
    price: 100,
    imageUrl: 'http',
  );

  const testProductEntity = ProductEntity(
    id: '1',
    name: 'shoes',
    description: 'men/s shoes',
    price: 100,
    imageUrl: 'http',
  );

  const testId = '1';

  group('get product by id', () {
    test('should return product when a call to data source is successful', () async {
      // arrange
      when(mockRemoteDataSource.getProductById(testId))
          .thenAnswer((_) async => testProductModel);

      // act
      final result = await repository.getProductById(testId);

      // assert
      expect(result, Right(testProductEntity));
    });

    test('should return a ServerFailure when a call to remote data source fails', () async {
      // arrange
      when(mockRemoteDataSource.getProductById(testId))
          .thenThrow(ServerException());

      // act
      final result = await repository.getProductById(testId);

      // assert
      expect(result, Left(ServerFailure('Server error')));
    });

    test('should return a NetworkFailure when there is no network connection', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.getProductById(testId);

      // assert
      expect(result, Left(NetworkFailure('No network connection')));
    });
  });
}
