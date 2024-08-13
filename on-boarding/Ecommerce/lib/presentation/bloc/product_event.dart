// product_event.dart
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

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

  UpdateProductEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddProductEvent extends ProductEvent {
  final ProductEntity productEntity;

  AddProductEvent(this.productEntity);

  @override
  List<Object> get props => [productEntity];
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
