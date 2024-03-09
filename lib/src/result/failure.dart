part of tie_fp;

/// `Failure` descends from [Result]
/// allowing to safely return wrap an [Exception]
/// and get the [StackStrace] if applies.

final class Failure<T> extends Result<T> {
  final Object? error;
  final StackTrace _stackTrace;

  Failure(
    this.error, [
    StackTrace? stackTrace,
    bool report = true,
  ]) : _stackTrace = stackTrace ?? StackTrace.current {
    if (report) ResultError.onError?.call(this);
  }

  @override
  Object? getError() => error;

  @override
  String toString() => 'Failure: $error';

  @override
  bool isError() => true;

  @override
  T getValue() {
    throw Failure('failure data cannot return a value');
  }

  @override
  StackTrace? stackTrace() => _stackTrace;
}
