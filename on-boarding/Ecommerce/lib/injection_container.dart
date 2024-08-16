import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './domain/usecases/add_product_usecase.dart';
import './domain/usecases/delete_product_usecase.dart';
import './domain/usecases/get_all_product_usecase.dart';
import './domain/usecases/get_product_usecase.dart';
import './domain/usecases/update_product_usecase.dart';
import 'core/network/network_info.dart';
import 'core/util/input_convertor.dart';
import 'data/data_sources/local_data_source.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register InputConvertor as a singleton
  sl.registerLazySingleton(() => InputConvertor());

  // Register ProductBloc without the InputConvertor parameter
  sl.registerFactory(() => ProductBloc(
        getAllProductsUsecase: sl(),
        deleteProductUseCase: sl(),
        insertProductUseCase: sl(),
        getProductUseCase: sl(),
        updateProductUseCase: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProdcutsUsecase(productRepository: sl()));
  sl.registerLazySingleton(() => GetProductUseCase(sl()));
  sl.registerLazySingleton(() => InsertProductUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProductUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}