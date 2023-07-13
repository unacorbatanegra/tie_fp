import 'package:test/test.dart';
import 'package:tie_fp/tie_fp.dart';

void main() {
  group('Result test', () {
    late Result value;
    late Result valueError;
    setUp(() {
      value = Success(1);
      valueError = Failure(Exception('custom message'));
      return;
    });

    test('Value returns no error', () {
      expect(value.isError(), false);
    });
    test('Value is int', () {
      expect(value.getValue(), isA<int?>());
    });
    test('Value is 1', () {
      expect(value.getValue(), 1);
    });
    test(
      'Value Error is error',
      () => expect(valueError.isError(), true),
    );
    test(
      'Value Error get error is exception',
      () => expect(valueError.getError(), isException),
    );

    test(
      'Value Error value is null',
      () => expect(() => valueError.getValue(), throwsA(isA<Failure>())),
    );
  });
}
