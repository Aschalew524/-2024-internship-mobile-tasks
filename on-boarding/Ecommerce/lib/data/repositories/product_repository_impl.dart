import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../core/error/exception.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  
/* class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  

  ProductRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
*/

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await productRemoteDataSource.deleteProduct(productId);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String productId) async {
    try {
      final productModel = await productRemoteDataSource.getProduct(productId);
      return Right(productModel);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> insertProduct(ProductEntity product) async {
    try {
      await productRemoteDataSource.insertProduct(product);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductEntity product) async {
    try {
      await productRemoteDataSource.updateProduct(product);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final productModels = await productRemoteDataSource.getAllProducts();
      print('repo data');
      print(productModels);
      return Right(productModels);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }
}
