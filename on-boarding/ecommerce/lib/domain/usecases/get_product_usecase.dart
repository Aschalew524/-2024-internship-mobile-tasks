import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductUseCase {
  final ProductRepository productRepository;
  GetProductUseCase(this.productRepository);

  Future<Either<Failure, ProductEntity>> execute(String id) async {
    return await productRepository.getProduct(id);
  }
}