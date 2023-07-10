part of tie_fp;

final class Failure<T> extends Result<T> {
  final Object? error;

  Failure(
    this.error, [
    this._stackTrace,
  ]) {
    ResultError.onError?.call(this);
  }

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
