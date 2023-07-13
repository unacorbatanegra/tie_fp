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

Future<Result<int>> performOperation() async {
  // Perform some operation that may succeed or fail
  try {
    var value = await Future.value(42);
    return Success(value);
  } catch (e) {
    return Failure(e);
  }
}

Result tryCatchExample<T>() {
  try {
    var result = performOperationThatMayThrowException();
    return Success(result);
  } catch (e) {
    return Failure(e);
  }
}

List<int> test() => List.generate(1, (index) => index);

Object performOperationThatMayThrowException() => throw UnimplementedError();
