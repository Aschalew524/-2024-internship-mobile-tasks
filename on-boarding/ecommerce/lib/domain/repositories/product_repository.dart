  import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, void>> insertProduct(ProductEntity product);
  Future<Either<Failure, void>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String id);
}