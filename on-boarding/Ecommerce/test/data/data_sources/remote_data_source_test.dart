

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:task_7/core/constants/constants.dart';
import 'package:task_7/core/error/exception.dart';
import 'package:task_7/data/data_sources/remote_data_source.dart';
import 'package:task_7/data/models/product_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testId = '123';

  group('get Product', () {
    test('should return Product model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProduct(testId)))).thenAnswer(
          (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200));

      //act
      final result = await productRemoteDataSourceImpl.getProduct(testId);

      //assert
      expect(result, isA<ProductModel>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(Urls.getProduct(testId))),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = productRemoteDataSourceImpl.getProduct(testId);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
