part of tie_fp;

/// `Failure` descends from [Result]
/// allowing to safely return wrap an [Exception]
/// and get the [StackStrace] if applies.

final class Failure<T> extends Result<T> {
  final Object? error;

  Failure(
    this.error, [
    this._stackTrace,
  ]) {
    _stackTrace ??= StackTrace.current;
    // print('_stackTrace: ${_stackTrace.runtimeType} $_stackTrace');
    ResultError.onError?.call(this);
  }

  @override
  Object? getError() => error;

  @override
  String toString() => error.toString();

  @override
  bool isError() => true;

  StackTrace? _stackTrace;

  @override
  StackTrace? stackTrace() => _stackTrace;

  @override
  T getValue() {
    throw Failure('failure data cannot return a value');
  }
}
