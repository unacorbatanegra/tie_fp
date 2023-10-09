import 'package:tie_fp/tie_fp.dart';

Future<Result<int>> performOperation() =>
    Future.value(42).then((value) => throw Exception('test')).toResult();
