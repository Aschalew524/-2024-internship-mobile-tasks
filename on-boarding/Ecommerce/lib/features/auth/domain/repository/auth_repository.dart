import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/User.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> signUp(User user);


  Future<Either<Failure, bool>> signIn(User user) ;

/*   Future<Either<Failure, bool>> userLogOut();
  Future<Either<Failure, String?>> getToken(); */
}