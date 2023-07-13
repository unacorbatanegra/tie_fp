import 'package:test/test.dart';
import 'package:tie_fp/tie_fp.dart';

void main() {
  group('Extensions result', () {
    int value(int v) => v;
    int valueError() => throw Exception();
    Future<int> futureValue() => Future.value(1);
    Future<int> futureError() async => throw Exception();

    test('Function return error', () {
      // final a = Result.t;
      final r = Result.wrapFunction(() => valueError());
      expect(r, isA<Result>());
      expect(r.isError(), true);
      expect(r.getError(), isException);
      expect(r.getValue(), isNull);
    });
    test('Function return value', () {
      // final a = Result.t;
      final r = Result.wrapFunction(() => value(1));
      expect(r, TypeMatcher<Result<int>>());
      expect(r.isError(), false);
      expect(r.getError(), isNull);
      expect(r.getValue(), 1);
    });
    test('Future return value', () async {
      // final a = Result.t;
      final r = await futureValue().toResult();
      expect(r, TypeMatcher<Result<int>>());
      expect(r.isError(), false);
      expect(r.getError(), isNull);
      expect(r.getValue(), 1);
    });
    test('Future throws error', () async {
      final r = await futureError().toResult();

      expect(r, isA<Result>());
      expect(r.isError(), true);
      expect(r.getError(), isException);
      // expect(r.getValue(), isNull);
    });

    // test('Function pass extension return error', () async {
    //   final r = valueError().toResult();
    //   expect(r, isA<Result>());
    //   expect(r.isError(), true);
    //   expect(r.getRawError(), isException);
    //   expect(r.getValue(), isNull);
    // });
    // test('Function pass extension return value', () async {
    //   final r = value(1).toResult();
    //   expect(r, TypeMatcher<Result<int>>());
    //   expect(r.isError(), false);
    //   expect(r.getRawError(), isNull);
    //   expect(r.getValue(), 1);
    // });
  });
}
