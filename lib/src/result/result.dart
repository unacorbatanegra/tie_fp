part of tie_fp;

sealed class Result<T> {
  const Result();

  T? getValue();
  String getError();
  bool isError();

  Object? getRawError();
  StackTrace? stackTrace();

  factory Result.wrapFunction(T Function() func) {
    try {
      final b = func();
      return Success(b);
    } catch (e) {
      return Failure(e);
    }
  }
}
