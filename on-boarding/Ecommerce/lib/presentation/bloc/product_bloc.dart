import 'package:bloc/bloc.dart';

import 'package:task_7/domain/usecases/add_product_usecase.dart';
import 'package:task_7/domain/usecases/delete_product_usecase.dart';
import 'package:task_7/domain/usecases/get_all_product_usecase.dart';
import 'package:task_7/domain/usecases/get_product_usecase.dart';
import 'package:task_7/domain/usecases/update_product_usecase.dart';
import 'package:task_7/presentation/bloc/product_event.dart';
import 'package:task_7/presentation/bloc/product_state.dart';




class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProdcutsUsecase getAllProductsUsecase;  // Corrected name
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
    emit(ProductsLoading());
    final result = await getAllProductsUsecase.call();
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.toString())),
      (products) => emit(AllProductsLoaded(products)),
    );
  }

  Future<void> _onGetProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductsLoading());
    final result = await getProductUseCase.execute(event.id);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.toString())),
      (product) => emit(ProductLoaded(product)),
    );
  }

  Future<void> _onUpdateProduct(UpdateProductEvent event, Emitter<ProductState> emit) async {
  emit(ProductUpdating());
  final result = await updateProductUseCase.execute(event.productEntity);
  result.fold(
    (failure) => emit(ProductOperationFailure(failure.toString())),
    (_) => emit(ProductOperationSuccess()),
  );
}


  Future<void> _onAddProduct(AddProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductAdding());
    final result = await insertProductUseCase.call(event.productEntity);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.toString())),
      (_) => emit(ProductOperationSuccess()),
    );
  }

  Future<void> _onDeleteProduct(DeleteProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductDeleting());
    final result = await deleteProductUseCase.execute(event.id);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.toString())),
      (_) => emit(ProductOperationSuccess()),
    );
  }
}
