import 'package:virtual_wearing_app_flutter/features/user/data/models/user.dart';
import 'package:virtual_wearing_app_flutter/shared/network/network.dart';

class UserRepository {
  Future<User> login(String email, String password) async {
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };

    try {
      var res = await NetworkHelper.request(
        method: 'POST',
        url: 'customer/login',
        data: data,
      );

      var json = {
        "name": "Muhammad Ismail",
        "email": "itsmuhammadismail@gmail.com",
        "token": res['token']
      };

      User user = User.fromJson(json);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register(String name, String email, String password) async {
    Map<String, dynamic> data = {
      "email": email,
      "name": name,
      "password": password,
    };

    try {
      var res = await NetworkHelper.request(
        method: 'POST',
        url: 'customer/register',
        data: data,
      );

      var json = {
        "name": "Muhammad Ismail",
        "email": "itsmuhammadismail@gmail.com",
        "token": "",
      };

      User user = User.fromJson(json);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser(String name, String email, String password) async {
    Map<String, dynamic> data = {
      "email": email,
      "name": name,
      "password": password,
    };

    try {
      var res = await NetworkHelper.request(
        method: 'POST',
        url: 'customer/register',
        data: data,
      );

      User user = User.fromJson(res);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
