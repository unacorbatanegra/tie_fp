part of tie_fp;

sealed class Result<T> {
  const Result();

  T? getValue();
  String getError();
  bool isError();

  Object? getRawError();
  StackTrace? stackTrace();
}

final class Success<T> extends Result<T> {
  final T data;
  Success(this.data);

  @override
  String getError() => '';

  @override
  T getValue() => data;

  @override
  bool isError() => false;

  @override
  Object? getRawError() => null;

  @override
  StackTrace? stackTrace() => null;
}

final class Failure<T> extends Result<T> {
  final Object? error;

  Failure(
    this.error, [
    this._stackTrace,
  ]);

  @override
  String getError() {
    return error.toString();
  }

  @override
  T? getValue() => null;

  @override
  bool isError() => true;

  @override
  Object? getRawError() => error;

  final StackTrace? _stackTrace;

  @override
  StackTrace? stackTrace() => _stackTrace;
}
