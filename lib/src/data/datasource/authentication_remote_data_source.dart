import 'package:globedock/src/common/api.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

abstract class AuthenticationRemoteDataSource {
  FutureOr<void> login(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio dio = Dio();

  @override
  FutureOr<void> login(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await dio.post(API.LOGIN, data: {
        'email': email,
        'password': password,
      });
      final token = response.data['token'];
      await prefs.setString(ACCESS_TOKEN, token);
    } catch (e) {
      rethrow;
    }
  }
}
