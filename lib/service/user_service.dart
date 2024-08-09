import 'dart:developer';
import 'package:appscrip/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  final url = "https://jsonplaceholder.typicode.com/users";
  Dio dio = Dio();
  getUser() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((user) => UserModel.fromJson(user)).toList();
      } else {
        log("failed to load users in service");
      }
    } catch (e) {
      log("error in service $e");
    }
  }
}
