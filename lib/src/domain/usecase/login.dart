import 'dart:async';

import 'package:globedock/src/common/failure.dart';
import 'package:globedock/src/domain/repositories/autentication_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  SignIn(this._repository);
  final AuthenticationRepository _repository;

  FutureOr<Either<Failure, void>> execute(String email, String password) async {
    return await _repository.login(email, password);
  }
}
