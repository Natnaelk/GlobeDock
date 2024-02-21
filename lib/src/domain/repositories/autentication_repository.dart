import 'dart:async';

import 'package:globedock/src/common/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  FutureOr<Either<Failure, void>> login(String email, String password);
}
