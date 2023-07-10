part of tie_fp;

extension ResultFuture<T> on Future<T> {
  Future<Result<E>> _execute<E>(Future<E> com) async {
    try {
      final r = await com;
      return Success(r);
    } catch (e, s) {
      return Failure(e, s);
    }
  }

  Future<Result<T>> toResult() => _execute(this);
}

extension ToResultFunction<T> on T Function<T>() {
  Result<T> _fromFuncton(T Function() func) {
    try {
      final b = func();
      return Success(b);
    } catch (e) {
      return Failure(e);
    }
  }

  Result<T> toResult() => _fromFuncton(this());
}
