import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solar_calculation_system/model/user.dart';
import 'package:solar_calculation_system/prefrences/preference_manager.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';

import '../utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  var _loading = false;

  get loading => _loading;

  var _passwordHidden = true;

  get passwordHidden => _passwordHidden;

  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  setPasswordHidden(bool status) {
    _passwordHidden = status;
    notifyListeners();
  }

  Future<void> login(BuildContext context, Users user) async {
    setLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(email: user.email, password: user.password)
        .then((value) => onLoginSuccess(context,value))
        .onError((error, stackTrace) => onLoginFailed(context, error!))
        .timeout(Duration(seconds: 30));
  }

  onLoginFailed(BuildContext context, Object error) {
    setLoading(false);
    if (error.toString().contains("The email address is badly formatted")) {
      Utils.showErrorDialog(context, "Failed", "Invalid Email");
    } else if (error
        .toString()
        .contains("Password should be at least 6 characters")) {
      Utils.showErrorDialog(
          context, "Failed", "Password should be at least 6 characters");
    } else if (error
        .toString()
        .contains("The email address is already in use by another account")) {
      Utils.showErrorDialog(context, "Failed",
          "The email address is already in use by another account.");
    } else if (error
        .toString()
        .contains("The supplied auth credential is incorrect, malformed or has expired")) {
      Utils.showErrorDialog(context, "Failed",
          "Invalid User Information.");
    } else {
      Utils.showErrorDialog(context, "Failed",
          "Please check your internet connection and try again");
    }
  }

  onLoginSuccess(BuildContext context,UserCredential value) {
    setLoading(false);
    Utils.showToast("Login Successfully");
    PreferenceManager.setUserLoggedIn();
    PreferenceManager.setUserName(value!.user!.email!.toString());
    Navigator.pushReplacementNamed(context, RouteNames.ROUTE_HOME_SCREEN);
  }
}
