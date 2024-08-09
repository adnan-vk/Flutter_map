import 'dart:developer';
import 'package:appscrip/model/user_model.dart';
import 'package:appscrip/service/user_service.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  UserService userService = UserService();
  List<UserModel> allUsers = [];
  List searchedList = [];
  bool loading = false;
  Future<void> getUser() async {
    try {
      allUsers = await userService.getUser();
      searchedList = allUsers;
      notifyListeners();
    } catch (e) {
      log("error in provider : $e");
    }
  }

  loadUser() async {
    final allUser = await userService.getUser();
    searchedList = allUser;
    notifyListeners();
  }

  search(String enterName) {
    if (enterName.isNotEmpty) {
      searchedList = allUsers
          .where(
            (UserModel user) => user.name!.toLowerCase().contains(
                  enterName.toLowerCase(),
                ),
          )
          .toList();
    } else {
      searchedList = allUsers;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 1));
    allUsers = [];
    await getUser();
    loading = false;
    notifyListeners();
  }
}
