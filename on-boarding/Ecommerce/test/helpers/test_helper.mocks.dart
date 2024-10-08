// Mocks generated by Mockito 5.4.4 from annotations
// in task_7/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i18;
import 'dart:typed_data' as _i20;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i19;
import 'package:shared_preferences/src/shared_preferences_legacy.dart' as _i11;
import 'package:task_7/core/error/failure.dart' as _i7;
import 'package:task_7/core/util/input_convertor.dart' as _i17;
import 'package:task_7/features/product/data/data_sources/remote_data_source.dart'
    as _i10;
import 'package:task_7/features/product/domain/entities/product.dart' as _i8;
import 'package:task_7/features/product/domain/entities/productToAddEntity.dart'
    as _i9;
import 'package:task_7/features/product/domain/repositories/product_repository.dart'
    as _i4;
import 'package:task_7/features/product/domain/usecases/add_product_usecase.dart'
    as _i14;
import 'package:task_7/features/product/domain/usecases/delete_product_usecase.dart'
    as _i16;
import 'package:task_7/features/product/domain/usecases/get_all_product_usecase.dart'
    as _i13;
import 'package:task_7/features/product/domain/usecases/get_product_usecase.dart'
    as _i12;
import 'package:task_7/features/product/domain/usecases/update_product_usecase.dart'
    as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_1 extends _i1.SmartFake implements Duration {
  _FakeDuration_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_2 extends _i1.SmartFake
    implements _i3.AddressCheckResult {
  _FakeAddressCheckResult_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductRepository_3 extends _i1.SmartFake
    implements _i4.ProductRepository {
  _FakeProductRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i4.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>>
      getAllProducts() => (super.noSuchMethod(
            Invocation.method(
              #getAllProducts,
              [],
            ),
            returnValue: _i6
                .Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.ProductEntity>>(
              this,
              Invocation.method(
                #getAllProducts,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>> getProduct(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.ProductEntity>(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> insertProduct(
          _i9.AddEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [product],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #insertProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> updateProduct(
          _i8.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [product],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #updateProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> deleteProduct(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #deleteProduct,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i10.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  dynamic deleteProduct(String? productId) =>
      super.noSuchMethod(Invocation.method(
        #deleteProduct,
        [productId],
      ));

  @override
  dynamic getProduct(String? productId) => super.noSuchMethod(Invocation.method(
        #getProduct,
        [productId],
      ));

  @override
  dynamic insertProduct(_i9.AddEntity? product) =>
      super.noSuchMethod(Invocation.method(
        #insertProduct,
        [product],
      ));

  @override
  dynamic updateProduct(_i8.ProductEntity? product) =>
      super.noSuchMethod(Invocation.method(
        #updateProduct,
        [product],
      ));
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i11.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i6.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i3.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_1(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);

  @override
  Duration get checkTimeout => (super.noSuchMethod(
        Invocation.getter(#checkTimeout),
        returnValue: _FakeDuration_1(
          this,
          Invocation.getter(#checkTimeout),
        ),
      ) as Duration);

  @override
  List<_i3.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i3.AddressCheckOptions>[],
      ) as List<_i3.AddressCheckOptions>);

  @override
  set addresses(List<_i3.AddressCheckOptions>? value) => super.noSuchMethod(
        Invocation.setter(
          #addresses,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i3.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i6.Future<_i3.InternetConnectionStatus>.value(
            _i3.InternetConnectionStatus.connected),
      ) as _i6.Future<_i3.InternetConnectionStatus>);

  @override
  _i6.Stream<_i3.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i6.Stream<_i3.InternetConnectionStatus>.empty(),
      ) as _i6.Stream<_i3.InternetConnectionStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<_i3.AddressCheckResult> isHostReachable(
          _i3.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i6.Future<_i3.AddressCheckResult>.value(_FakeAddressCheckResult_2(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i6.Future<_i3.AddressCheckResult>);
}

/// A class which mocks [GetProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductUseCase extends _i1.Mock implements _i12.GetProductUseCase {
  MockGetProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeProductRepository_3(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i4.ProductRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>> execute(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.ProductEntity>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.ProductEntity>>);
}

/// A class which mocks [GetAllProdcutsUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProdcutsUsecase extends _i1.Mock
    implements _i13.GetAllProdcutsUsecase {
  MockGetAllProdcutsUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeProductRepository_3(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i4.ProductRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.ProductEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.ProductEntity>>>);
}

/// A class which mocks [InsertProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockInsertProductUseCase extends _i1.Mock
    implements _i14.InsertProductUseCase {
  MockInsertProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeProductRepository_3(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i4.ProductRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> call(_i9.AddEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [product],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [product],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [UpdateProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProductUseCase extends _i1.Mock
    implements _i15.UpdateProductUseCase {
  MockUpdateProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeProductRepository_3(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i4.ProductRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> execute(
          _i8.ProductEntity? productEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [productEntity],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #execute,
            [productEntity],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [DeleteProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteProductUseCase extends _i1.Mock
    implements _i16.DeleteProductUseCase {
  MockDeleteProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeProductRepository_3(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i4.ProductRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> execute(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [InputConvertor].
///
/// See the documentation for Mockito's code generation for more information.
class MockInputConvertor extends _i1.Mock implements _i17.InputConvertor {
  MockInputConvertor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Either<_i17.InputError, int> stringToUnsignedInteger(String? str) =>
      (super.noSuchMethod(
        Invocation.method(
          #stringToUnsignedInteger,
          [str],
        ),
        returnValue: _FakeEither_0<_i17.InputError, int>(
          this,
          Invocation.method(
            #stringToUnsignedInteger,
            [str],
          ),
        ),
      ) as _i2.Either<_i17.InputError, int>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i19.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i20.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i20.Uint8List>.value(_i20.Uint8List(0)),
      ) as _i6.Future<_i20.Uint8List>);

  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i5.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
