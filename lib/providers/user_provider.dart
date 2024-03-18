import 'package:flutter/material.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;

  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    // print('PROVIDERRRRRRRRRRRRRRRRr');
    User user = await _authMethods.getUserDetails();
    // print('PROVIDERRRRRRRRRRRRRRRRr USERRRRRRRRRRr ${user}');
    _user = user;
    notifyListeners();
  }
}