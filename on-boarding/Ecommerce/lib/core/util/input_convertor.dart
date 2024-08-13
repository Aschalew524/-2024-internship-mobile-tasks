import 'package:dartz/dartz.dart';

import '../error/failure.dart';

class InputError extends Failure {
  const InputError(super.message);
}

class InputConvertor {
  Either<InputError, int> stringToUnsignedInteger(String str) {
    try {
      int value = int.parse(str, radix: 10);
      if (value < 0) {
        return left(InputError('Input string is not an unsigned integer: $str'));
      }
      return right(value);
    } on FormatException {
      return left(InputError('Invalid input string: $str'));
    }
  }
}