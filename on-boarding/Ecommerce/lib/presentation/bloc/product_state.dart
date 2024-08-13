// product_state.dart


import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class AllProductsLoaded extends ProductState {
  final List<ProductEntity> products;

  const AllProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductLoaded extends ProductState {
  final ProductEntity product;

  const ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductAdding extends ProductState {}

class ProductUpdating extends ProductState {}

class ProductDeleting extends ProductState {}

class ProductOperationSuccess extends ProductState {}

// product_state.dart
class ProductOperationFailure extends ProductState {
  final String errorMessage;

  const ProductOperationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


