import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_7/core/error/failure.dart';
import 'package:task_7/features/product/domain/entities/product.dart';
import 'package:task_7/features/product/domain/entities/productToAddEntity.dart';
import 'package:task_7/features/product/presentation/bloc/product_bloc.dart';
import 'package:task_7/features/product/presentation/bloc/product_event.dart';
import 'package:task_7/features/product/presentation/bloc/product_state.dart';
import '../helpers/test_helper.dart';
import '../helpers/test_helper.mocks.dart';

void main() {
  group('ProductBloc', () {
    late ProductBloc productBloc;
    late MockInsertProductUseCase mockInsertProductUseCase;
    late MockGetAllProdcutsUsecase mockGetAllProductsUseCase;
    late MockGetProductUseCase mockGetProductUseCase;
    late MockUpdateProductUseCase mockUpdateProductUseCase;
    late MockDeleteProductUseCase mockDeleteProductUseCase;
    late MockInputConvertor mockInputConvertor;

    setUp(() {
      mockInsertProductUseCase = MockInsertProductUseCase();
      mockGetAllProductsUseCase = MockGetAllProdcutsUsecase();
      mockGetProductUseCase = MockGetProductUseCase();
      mockUpdateProductUseCase = MockUpdateProductUseCase();
      mockDeleteProductUseCase = MockDeleteProductUseCase();
      mockInputConvertor = MockInputConvertor();

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



    //////////////////////////////////// insert product event test         ///////////////////////////////////////////////  
    



    blocTest<ProductBloc, ProductState>(
      'emits [ProductAdding, ProductOperationSuccess] when AddProductEvent is added and the use case returns success',
      build: () {
        
        when(mockInsertProductUseCase.call(any)).thenAnswer(
          (_) async => const Right<Failure, Unit>(unit), 
        );
        return productBloc;
      },
      act: (bloc) => bloc.add( AddProductEvent(AddEntity(
       
        name: 'shoes',
        description: 'best shoes',
        price: 200,
       image: File('mock image'),
      ))),
      expect: () => [
        ProductAdding(),
        ProductOperationSuccess(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductAdding, ProductOperationFailure] when AddProductEvent is added and the use case returns an error',
      build: () {
        // Mock the use case to return an error
        when(mockInsertProductUseCase.call(any)).thenAnswer(
          (_) async => Left<Failure, Unit>(MockFailure()),  
        );
        return productBloc;
      },
      act: (bloc) => bloc.add( AddProductEvent(AddEntity(
       
        name: 'shoes',
        description: 'best shoes',
        price: 200,
        image: File('mock image'),
      ))),
      expect: () => [
        ProductAdding(),
        const ProductOperationFailure('MockFailure'), 
      ],
    );


/////////////////////////////////////////   delete product event /////////////////////////////////////////////



    blocTest<ProductBloc, ProductState>(
      'emits [ProductDeleting, ProductOperationSuccess] when DeleteProductEvent is added and the use case returns success',
      build: () {
        
        when(mockDeleteProductUseCase.execute(any)).thenAnswer(
          (_) async => const Right<Failure, void>(unit), 
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const DeleteProductEvent('1')), 
      expect: () => [
        ProductDeleting(),
        ProductOperationSuccess(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductDeleting, ProductOperationFailure] when DeleteProductEvent is added and the use case returns an error',
      build: () {
        // Mock the delete use case to return an error
        when(mockDeleteProductUseCase.execute(any)).thenAnswer(
          (_) async => Left<Failure, void>(MockFailure()), 
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const DeleteProductEvent('1')), 
      expect: () => [
        ProductDeleting(),
        const ProductOperationFailure('MockFailure'), 
      ],
    );




    //////////////////////////////////////////////                                 get product event                           / //////////////




   blocTest<ProductBloc, ProductState>(
      'emits [ProductsLoading, ProductLoaded] when GetProductEvent is added and the use case returns a product',
      build: () {
        const product = ProductEntity(
          id: '1',
          name: 'shoes',
          description: 'best shoes',
          price: 200,
          imageUrl: 'http',
        );

        when(mockGetProductUseCase.execute(any)).thenAnswer(
          (_) async => const Right<Failure, ProductEntity>(product),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent('1')), 
      expect: () => [
        ProductsLoading(),
        const ProductLoaded(ProductEntity(
          id: '1',
          name: 'shoes',
          description: 'best shoes',
          price: 200,
          imageUrl: 'http',
        )),
      ],
    );

    final failure = MockFailure();
    blocTest<ProductBloc, ProductState>(
      'emits [ProductsLoading, ProductOperationFailure] when GetProductEvent is added and the use case returns an error',
      build: () {

        when(mockGetProductUseCase.execute(any)).thenAnswer(
          (_) async => Left<Failure, ProductEntity>(failure),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent('1')), 
      expect: () => [
        ProductsLoading(),
        ProductOperationFailure(failure.toString()),
      ],
    );


    ////////////////////////////////////////////////////// get all products event /////////////////////////////////
   


 blocTest<ProductBloc, ProductState>(
      'emits [ProductsLoading, AllProductsLoaded] when GetAllProductsEvent is added and the use case returns a list of products',
      build: () {
        final products = [
          const ProductEntity(
            id: '1',
            name: 'shoes',
            description: 'best shoes',
            price: 200,
            imageUrl: 'http',
          ),
          const ProductEntity(
            id: '2',
            name: 'shoes',
            description: 'cool shoes',
            price: 50,
            imageUrl: 'http',
          ),
        ];
        


        when(mockGetAllProductsUseCase.call()).thenAnswer(
          (_) async => Right<Failure, List<ProductEntity>>(products),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(GetAllProductsEvent()), 
      expect: () => [
        ProductsLoading(),
        const AllProductsLoaded([
          ProductEntity(
            id: '1',
            name: 'shoes',
            description: 'best shoes',
            price: 200,
            imageUrl: 'http',
          ),
          ProductEntity(
            id: '2',
            name: 'shoes',
            description: 'cool shoes',
            price: 50,
            imageUrl: 'http',
          ),
        ]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductsLoading, ProductOperationFailure] when GetAllProductsEvent is added and the use case returns an error',
      build: () {
        
        when(mockGetAllProductsUseCase.call()).thenAnswer(
          (_) async => Left<Failure, List<ProductEntity>>(failure),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(GetAllProductsEvent()), 
      expect: () => [
        ProductsLoading(),
        ProductOperationFailure(failure.toString()),
      ],
    );



    /////////////////////////////////////////////////////// update  product event ///////// ////////////////////////////////////////////////
    


blocTest<ProductBloc, ProductState>(
      'emits [ProductUpdating, ProductOperationSuccess] when UpdateProductEvent is added and the use case returns success',
      build: () {
        when(mockUpdateProductUseCase.execute(any)).thenAnswer(
          (_) async => const Right<Failure, void>(unit),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const UpdateProductEvent(
        id: '1',
        productEntity: ProductEntity(
          id: '1',
          name: 'updated shoes',
          description: 'updated description',
          price: 150,
          imageUrl: 'http',
        ),
      )),
      expect: () => [
        ProductUpdating(),
        ProductOperationSuccess(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductUpdating, ProductOperationFailure] when UpdateProductEvent is added and the use case returns failure',
      build: () {
        when(mockUpdateProductUseCase.execute(any)).thenAnswer(
          (_) async => Left<Failure, void>(MockFailure()),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const UpdateProductEvent(
        id: '1',
        productEntity: ProductEntity(
          id: '1',
          name: 'updated shoes',
          description: 'updated description',
          price: 150,
          imageUrl: 'http',
        ),
      )),
      expect: () => [
        ProductUpdating(),
        const ProductOperationFailure('MockFailure'),
      ],
    );
  });
}
    
