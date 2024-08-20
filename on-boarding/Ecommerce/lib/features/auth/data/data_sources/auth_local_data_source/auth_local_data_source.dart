import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource{

  Future<void> saveToken(String token);
  Future<void> getToken();


  
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{

  final SharedPreferences store;
  AuthLocalDataSourceImpl({required this.store});


  
@override
Future<void> saveToken(String token)async{
  final value = await store.setString('token', token);

  

}
@override
  Future<String> getToken() async{
  final value = await store.getString('token');
  return value!;


  }

 

}