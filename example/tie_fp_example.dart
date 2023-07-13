import 'package:tie_fp/tie_fp.dart';

void main() async {
  Result<int> result = await performOperation();

  if (result.isError()) {
    print('An error occurred: ${result.getError()}');
  } else {
    int value = result.getValue();
    print('Operation successful! Result: $value');
  }

  // final v = test().toResult();
}

Future<Result<int>> performOperation() => Future.value(42).toResult();

Result tryCatchExample<T>() =>
    Result.wrapFunction(() => performOperationThatMayThrowException());

List<int> test() => List.generate(1, (index) => index);

Object performOperationThatMayThrowException() => throw UnimplementedError();
