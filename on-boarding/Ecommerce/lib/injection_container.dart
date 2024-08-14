 
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

// sl= service locator
final  sl= GetIt.instance;
Future<void> init() async {
  // ! features product


  //bloc

  sl.registerFactory(()=>ProductBloc(
    getAllProductsUsecase: sl(),
    deleteProductUseCase: sl(),
    insertProductUseCase: sl(),
    getProductUseCase: sl(),
    updateProductUseCase: sl(),
    input_convertor : sl()
  ),);


  ////usecases
  sl.registerFactory(() => DeleteProductUseCase( sl()));
  sl.registerFactory(() => GetAllProdcutsUsecase(productRepository: sl()));
  sl.registerFactory(() => GetProductUseCase(sl()));
  sl.registerFactory(() => InsertProductUseCase(sl()));
  sl.registerFactory(() => UpdateProductUseCase(sl()));

  
  // repository
sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl(),),);

  // data sources 

  sl.registerLazySingleton<ProductRemoteDataSource>(()=> ProductRemoteDataSourceImpl(client:sl()),);
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl(sharedPreferences: sl()),);

  /// core 
  sl.registerLazySingleton(()=> InputConvertor());
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(sl()) );
  
  
//// external 

 final sharedpreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedpreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}


