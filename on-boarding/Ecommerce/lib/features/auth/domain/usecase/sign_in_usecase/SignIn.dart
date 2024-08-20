import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entity/User.dart';
import '../../repository/auth_repository.dart';

class SignInUsecase {
  final UserRepository userRepository;

  SignInUsecase(this.userRepository);

  Future<Either<Failure, bool>> call(User user) async {
    return userRepository.signIn(user);
  }
}