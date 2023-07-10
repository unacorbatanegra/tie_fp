part of tie_fp;

abstract class ResultError {
  static bool enableLog = false;
  static Function(Failure va)? onError;
}
