import 'package:bloc/bloc.dart';

import '../../domain/usecases/add_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_all_product_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProdcutsUsecase getAllProductsUsecase;
  final GetProductUseCase getProductUseCase;
  final InsertProductUseCase insertProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  ProductBloc({
    required this.getAllProductsUsecase,
    required this.getProductUseCase,
    required this.insertProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
  }) : super(ProductInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<GetProductEvent>(_onGetProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<AddProductEvent>(_onAddProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  Future<void> _onGetAllProducts(GetAllProductsEvent event, Emitter<ProductState> emit) async {
    print('bloc stsrt');
  emit(ProductsLoading());
  try {
    final result = await getAllProductsUsecase.call();
    print('Fetched products: $result'); // Debug print
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.toString())),
      (products) {
        print('Products loaded: $products'); // Debug print
        emit(AllProductsLoaded(products));
      },
    );
  } catch (e) {
    emit(ProductOperationFailure(e.toString()));
  }
}

  Future<void> _onGetProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductsLoading());
    try {
      final result = await getProductUseCase.execute(event.id);
      result.fold(
        (failure) => emit(ProductOperationFailure(failure.toString())),
        (product) => emit(ProductLoaded(product)),
      );
    } catch (e) {
      emit(ProductOperationFailure(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(UpdateProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductUpdating());
    try {
      final result = await updateProductUseCase.execute(event.productEntity);
      result.fold(
        (failure) => emit(ProductOperationFailure(failure.toString())),
        (_) => emit(ProductOperationSuccess()),
      );
    } catch (e) {
      emit(ProductOperationFailure(e.toString()));
    }
  }

  Future<void> _onAddProduct(AddProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductAdding());
    try {
      final result = await insertProductUseCase.call(event.productEntity);
      result.fold(
        (failure) => emit(ProductOperationFailure(failure.toString())),
        (_) => emit(ProductOperationSuccess()),
      );
    } catch (e) {
      emit(ProductOperationFailure(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(DeleteProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductDeleting());
    try {
      final result = await deleteProductUseCase.execute(event.id);
      result.fold(
        (failure) => emit(ProductOperationFailure(failure.toString())),
        (_) => emit(ProductOperationSuccess()),
      );
    } catch (e) {
      emit(ProductOperationFailure(e.toString()));
    }
  }
}
