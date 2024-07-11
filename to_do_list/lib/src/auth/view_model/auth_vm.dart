import 'package:flutter/material.dart';
import 'package:groceryitems/src/auth/model/user_model.dart';

class AuthVM extends ChangeNotifier {
  UserModel userModel = UserModel();

  void addUserDetail(firstName, lastName, image, String email) {
    userModel.name = firstName;
    userModel.lastName = lastName;
    userModel.image = image;
  }

  void update() {
    notifyListeners();
  }
}
