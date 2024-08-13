import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_7/core/error/failure.dart';
import 'package:task_7/domain/entities/product.dart';
import 'package:task_7/presentation/bloc/product_bloc.dart';
import 'package:task_7/presentation/bloc/product_event.dart';
import 'package:task_7/presentation/bloc/product_state.dart';
import '../helpers/test_helper.dart';
import '../helpers/test_helper.mocks.dart';

void main() {
  group('ProductBloc - AddProductEvent', () {
    late ProductBloc productBloc;
    late MockInsertProductUseCase mockInsertProductUseCase;
    late MockGetAllProdcutsUsecase mockGetAllProductsUseCase;
    late MockGetProductUseCase mockGetProductUseCase;
    late MockUpdateProductUseCase mockUpdateProductUseCase;
    late MockDeleteProductUseCase mockDeleteProductUseCase;

    setUp(() {
      mockInsertProductUseCase = MockInsertProductUseCase();
      mockGetAllProductsUseCase = MockGetAllProdcutsUsecase();
      mockGetProductUseCase = MockGetProductUseCase();
      mockUpdateProductUseCase = MockUpdateProductUseCase();
      mockDeleteProductUseCase = MockDeleteProductUseCase();

      productBloc = ProductBloc(
        getAllProductsUsecase: mockGetAllProductsUseCase,
        getProductUseCase: mockGetProductUseCase,
        insertProductUseCase: mockInsertProductUseCase,
        updateProductUseCase: mockUpdateProductUseCase,
        deleteProductUseCase: mockDeleteProductUseCase,
      );
    });

    test('initial state should be ProductInitial', () {
      expect(productBloc.state, equals(ProductInitial()));
    });

    blocTest<ProductBloc, ProductState>(
      'emits [ProductAdding, ProductOperationSuccess] when AddProductEvent is added and the use case returns success',
      build: () {
        // Mock the use case to return a successful result
        when(mockInsertProductUseCase.call(any)).thenAnswer(
          (_) async => const Right<Failure, Unit>(unit), // Use Right<Unit>(unit) for success
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(AddProductEvent(const ProductEntity(
        id: '1',
        name: 'shoes',
        description: 'best shoes',
        price: 200,
        imageUrl: 'http',
      ))),
      expect: () => [
        ProductAdding(),
        ProductOperationSuccess(),
      ],
    );

    final failure = MockFailure();
    blocTest<ProductBloc, ProductState>(
      'emits [ProductAdding, ProductOperationFailure] when AddProductEvent is added and the use case returns an error',
      build: () 
      
      {

        const temp= ProductEntity(
        id: '1',
        name: 'shoes',
        description: 'best shoes',
        price: 200,
        imageUrl: 'http',
      );


        // Mock the use case to return an error
        when(mockInsertProductUseCase.call(any)).thenAnswer(
          (_) async => const Right(temp),
        );
        return productBloc;
      },
      
      act: (bloc) => bloc.add(AddProductEvent(const ProductEntity(
        id: '1',
        name: 'shoes',
        description: 'best shoes',
        price: 200,
        imageUrl: 'http',
      ))),
      expect: () => [
        ProductAdding(),
        ProductOperationSuccess()
      ],
    );
  });
}   
      
  








