part of tie_fp;

final class Success<T> extends Result<T> {
  final T data;

  Success(this.data);

  @override
  Object getError() {
    throw Failure('success class cannot contains an error.');
  }

  @override
  T getValue() => data;

  @override
  bool isError() => false;

  @override
  StackTrace? stackTrace() => StackTrace.current;

  @override
  String toString() => data.toString();
}
