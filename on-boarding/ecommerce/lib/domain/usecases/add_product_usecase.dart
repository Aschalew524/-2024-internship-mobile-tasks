import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class InsertProductUseCase {
  final ProductRepository productRepository;

  InsertProductUseCase(this.productRepository);

  Future<Either<Failure, void>> call(ProductEntity product) {
    return productRepository.insertProduct(product);
  }
}