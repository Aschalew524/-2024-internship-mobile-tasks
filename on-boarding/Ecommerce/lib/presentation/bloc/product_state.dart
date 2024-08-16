import 'package:equatable/equatable.dart';
import '../../domain/entities/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

// Separate loading states if needed
class ProductDetailLoading extends ProductState {}

class AllProductsLoaded extends ProductState {
  final List<ProductEntity> products;

  const AllProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

// Optional: State for when there are no products
class ProductsEmpty extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductEntity product;

  const ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductAdding extends ProductState {}

class ProductUpdating extends ProductState {}

class ProductDeleting extends ProductState {}

// Success states could be more descriptive or carry data if needed
class ProductOperationSuccess extends ProductState {}

// Optional: More specific success states
class ProductAddedSuccess extends ProductState {}
class ProductUpdatedSuccess extends ProductState {}
class ProductDeletedSuccess extends ProductState {}

// Handling operation failures with detailed error messages
class ProductOperationFailure extends ProductState {
  final String errorMessage;

  const ProductOperationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
