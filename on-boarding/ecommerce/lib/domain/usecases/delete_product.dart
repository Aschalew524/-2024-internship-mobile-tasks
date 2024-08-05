
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository productRepository;
  final int id;

  DeleteProduct({required this.productRepository, required this.id});

  Future<Either<Failure, Product>> call() async {
    return await productRepository.deleteProduct(id);
  }
}
