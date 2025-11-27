import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_calculation_system/utils/utils.dart';
import 'package:solar_calculation_system/viewmodel/sign_up_view_model.dart';

import '../model/user.dart';
import '../routeUtils/route_names.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    height: 150,
                    image: AssetImage("assets/images/register_icon.png")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "SIGNUP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Create Your Account",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.green.shade50,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.greenAccent.shade700,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<SignUpViewModel>(
                  builder: (context, viewModel, child) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: passwordController,
                          obscureText: viewModel.passwordHidden,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock_clock_outlined,
                              color: Colors.greenAccent.shade700,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  viewModel.setPasswordHidden(
                                      !viewModel.passwordHidden);
                                },
                                child: Icon(
                                  viewModel.passwordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.greenAccent.shade700,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: viewModel.onfirmPasswordHidden,
                          decoration: InputDecoration(
                            fillColor: Colors.green.shade50,
                            filled: true,
                            hintText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.lock_clock_outlined,
                              color: Colors.greenAccent.shade700,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  viewModel.setConfirmPasswordHidden(
                                      !viewModel.onfirmPasswordHidden);
                                },
                                child: Icon(
                                  viewModel.onfirmPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.greenAccent.shade700,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                          ),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Consumer<SignUpViewModel>(
                  builder: (context, signupViewMode, child) {
                    return InkWell(
                      onTap: () {

                        Users user = Users(
                            emailController.text, passwordController.text,confirmPasswordController.text);
                        if (isUserInfoValid(user)) {
                          signupViewMode.signUp(context, user);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.shade700,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: signupViewMode.loading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.ROUTE_LOGIN_SCREEN);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an Account? "),
                      Text("Login",
                          style: TextStyle(
                              color: Colors.greenAccent.shade700,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isUserInfoValid(Users user) {
    if(user.email.isEmpty){
      Utils.showToast("Please Enter Email");
      return false;
    }else if(user.password.isEmpty){
      Utils.showToast("Please Enter Password");
      return false;
    }else if(user.confirmPassword.isEmpty){
      Utils.showToast("Please Enter Confirm Password");
      return false;
    }else if(user.confirmPassword != user.password){
      Utils.showToast("Password not match with confirm password");
      return false;
    }else{
      return true;
    }
    // return user.email.isNotEmpty && user.password.isNotEmpty;
  }
}
