import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository productRepository;
  UpdateProductUseCase(this.productRepository);

  Future<Either<Failure, void>> execute(ProductEntity productEntity) async {
    return await productRepository.updateProduct(productEntity);
  }
}