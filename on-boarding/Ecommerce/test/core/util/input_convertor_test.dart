import 'package:flutter_test/flutter_test.dart';
import 'package:task_7/core/util/input_convertor.dart';

void main() {
  final inputConvertor = InputConvertor();

  group('stringToUnsignedInteger', () {
    test('should return right with valid unsigned integer', () {
      final result = inputConvertor.stringToUnsignedInteger('42');
      expect(result.isRight(), true);
      expect(result.getOrElse(() => 0), 42);
    });

    test('should return left with negative integer', () {
      final result = inputConvertor.stringToUnsignedInteger('-10');
      expect(result.isLeft(), true);
      expect(result.fold(
        (failure) => failure.message,
        (_) => '',
      ), 'Input string is not an unsigned integer: -10');
    });

    test('should return left with non-integer string', () {
      final result = inputConvertor.stringToUnsignedInteger('abc');
      expect(result.isLeft(), true);
      expect(result.fold(
        (failure) => failure.message,
        (_) => '',
      ), 'Invalid input string: abc');
    });
  });
}