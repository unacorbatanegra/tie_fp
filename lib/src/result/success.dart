part of tie_fp;

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
