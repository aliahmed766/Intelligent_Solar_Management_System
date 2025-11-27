import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solar_calculation_system/model/user.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/model/user.dart';
import 'package:solar_calculation_system/utils/utils.dart';

class SignUpViewModel with ChangeNotifier {
  var _loading = false;

  get loading => _loading;

  var _passwordHidden = true;

  get passwordHidden => _passwordHidden;
  var _confirmPasswordHidden = true;

  get onfirmPasswordHidden => _confirmPasswordHidden;

  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  setPasswordHidden(bool status) {
    _passwordHidden = status;
    notifyListeners();
  }

  setConfirmPasswordHidden(bool status) {
    _confirmPasswordHidden = status;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context, Users user) async {
    setLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password)
        .then((value) => onSignUpSuccess(value))
        .onError((error, stackTrace) => onSignUpFailed(context, error!))
        .timeout(Duration(seconds: 30));
  }

  onSignUpFailed(BuildContext context, Object error) {
    setLoading(false);
    if(error.toString().contains("The email address is badly formatted")){
      Utils.showErrorDialog(
          context, "Failed", "Invalid Email");
    }else if(error.toString().contains("Password should be at least 6 characters")){
      Utils.showErrorDialog(
          context, "Failed", "Password should be at least 6 characters");
    }else if(error.toString().contains("The email address is already in use by another account")){
      Utils.showErrorDialog(
          context, "Failed", "The email address is already in use by another account.");
    }else{
      Utils.showErrorDialog(context, "Failed",
          "Please check your internet connection and try again");
    }
  }

  onSignUpSuccess(UserCredential value) {
    setLoading(false);
    Utils.showToast("User Created Successfully");
  }
}
