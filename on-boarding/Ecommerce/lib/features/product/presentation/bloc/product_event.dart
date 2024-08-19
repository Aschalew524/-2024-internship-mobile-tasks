// product_event.dart
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/productToAddEntity.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductEvent {}

class GetProductEvent extends ProductEvent {
  final String id;

  const GetProductEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateProductEvent extends ProductEvent {
  final String id;
  final ProductEntity productEntity;  
  const UpdateProductEvent({
    required this.id,
    required this.productEntity,
  });

  @override
  List<Object> get props => [id, productEntity];
}


class AddProductEvent extends ProductEvent {
  final AddEntity productEntity;

  const AddProductEvent(this.productEntity);

  @override
  List<Object> get props => [productEntity];
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
