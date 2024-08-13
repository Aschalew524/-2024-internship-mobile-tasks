import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_7/core/error/failure.dart';
import 'package:task_7/data/data_sources/remote_data_source.dart';
import 'package:task_7/domain/repositories/product_repository.dart';
import 'package:task_7/domain/usecases/add_product_usecase.dart';
import 'package:task_7/domain/usecases/delete_product_usecase.dart';
import 'package:task_7/domain/usecases/get_all_product_usecase.dart';
import 'package:task_7/domain/usecases/get_product_usecase.dart';
import 'package:task_7/domain/usecases/update_product_usecase.dart';

@GenerateMocks([
  ProductRepository,
  ProductRemoteDataSource,
  SharedPreferences,
  InternetConnectionChecker,
  GetProductUseCase,
  GetAllProdcutsUsecase,
  InsertProductUseCase,
  UpdateProductUseCase,
  DeleteProductUseCase,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}

class MockFailure extends Mock implements Failure {}
