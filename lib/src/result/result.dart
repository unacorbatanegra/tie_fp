part of tie_fp;


/// [Result] is the base class of the `tie_fp` package
/// it is designed to safely return a value when no error happens
/// and the corresponding error if any exceptions is thrown.
sealed class Result<T> {
  const Result();

  T getValue();

  Object? getError();

  bool isError();

  StackTrace? stackTrace();

  /// [Result.wrapFunction()]
  /// Wraps any function inside a try catch
  /// and returning the corresponding [Success]/[Failure]
  factory Result.wrapFunction(T Function() func) {
    try {
      final b = func();
      return Success(b);
    } catch (e) {
      return Failure(e);
    }
  }
}
