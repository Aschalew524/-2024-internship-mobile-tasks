import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository productRepository;
  DeleteProductUseCase(this.productRepository);

  Future<Either<Failure, void>> execute(String id) async {
    return await productRepository.deleteProduct(id);
  }
}