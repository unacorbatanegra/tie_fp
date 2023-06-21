# Tie FP

A simple package that provides a class `Result` along with its subclasses `Success` and `Failure`. This package is designed to handle success and failure scenarios in a concise and type-safe manner.

## Usage

Here's an example of how you can use the `Result` package:

```dart
import 'package:tie_fp/tie_fp.dart';

void main() {
  Result<int> result = performOperation();

  if (result.isError()) {
    print('An error occurred: ${result.getError()}');
  } else {
    int value = result.getValue()!;
    print('Operation successful! Result: $value');
  }
}

Result<int> performOperation() {
  // Perform some operation that may succeed or fail
  if (operationSucceeded) {
    return Success(42);
  } else {
    return Failure('An error occurred');
  }
}

T tryCatchExample<T>(){
    try{
        var result=performOperationThatMayThrowException();
        return Success(result);
    }catch (e){
        return Failure(e);
    }
}
```

By using the methods provided by the `Result` class, you can easily handle success and failure cases without resorting to exceptions or error codes. This promotes a more expressive and safer coding style.

## Conclusion

The `Result` package simplifies the handling of success and failure scenarios by providing a sealed class that encapsulates the result and error information. It enables you to write cleaner and more robust code when dealing with operations that can succeed or fail.

We hope you find this package useful in your Dart projects! If you have any questions or feedback, please don't hesitate to reach out.
