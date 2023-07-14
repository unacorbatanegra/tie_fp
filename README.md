[![Pub Package](https://img.shields.io/pub/v/tie_fp.svg)](https://pub.dev/packages/tie_fp)

# Tie FP

A simple package that provides a class `Result` along with its subclasses `Success` and `Failure`. This package is designed to handle success and failure scenarios in a concise and type-safe manner.

This package is inspired but not based in:

- [Result - Rust](https://doc.rust-lang.org/std/result/)
- [Error - Go](https://go.dev/blog/error-handling-and-go)
- [Abseil Status - C++](https://abseil.io/docs/cpp/guides/status)

## Fundamentals

All `Functions` and `Futures` are error-prone making it difficult to make sure if anything went wrong without writing a lot of boilerplate with the try-catch escenarios.

The `Result` class tries to avoid these by using extensions and wrapping everything giving you only a `isError()` method to make sure the result of the computation, and avoiding the rethrow step.

If you need to perform operations that potentially throw an error you can do this:

```dart

Result<void> myFunction(){

  try {
    operation1();
    operation2();
    return Success(null);
  } catch(Exception exception, StackTrace stackTrace){
    return Failure(exception,stackTrace);
  }
}

void main(){

  final result= myFunction();
  if(result.isError()){
    /// perform something
    return;
  }

}
```

If you want to wrap a `Function` you can do this:

```dart
int operation() => 1;

void main(){
  Result<int> result = Result.wrapFunction(operation());
}
```

which is the equivalent of

```dart
try{
  final v=operation();
  return Success(v);
} catch(Exception exception, StackTrace stackTrace){
  return Failure(exception,stackTrace);
}

```

In the case of a `Future` the `toResult()` method is useful:

```dart
@override
Future<Result<Ride>> detailed(int id) => supabase
    .from(table)
    .select("*, user:profiles(*), vehicle(*) ")
    .eq('id', id)
    .limit(1)
    .single()
    .then((value) => Ride.fromMap(value))
    .toResult();
```

## Conclusion

The `Result` package simplifies the handling of success and failure scenarios by providing a sealed class that encapsulates the result and error information. It enables you to write cleaner and more robust code when dealing with operations that can succeed or fail.

We hope you find this package useful in your Dart projects! If you have any questions or feedback, please don't hesitate to reach out.
