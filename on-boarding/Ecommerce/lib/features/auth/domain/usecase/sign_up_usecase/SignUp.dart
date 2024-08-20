import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entity/User.dart';
import '../../repository/auth_repository.dart';

class SignUpUsecase {
  final UserRepository userRepository;
  SignUpUsecase(this.userRepository);

  Future<Either<Failure, bool>> call(User user) async {
    return await userRepository.signUp(user);
  }
}