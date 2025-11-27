import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_calculation_system/model/user.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/utils/utils.dart';
import 'package:solar_calculation_system/viewmodel/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(100.0)
                  ),
                  child: Image(
                      height: 180,
                      image: AssetImage("assets/images/login_logo.png")),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Login to Continue...",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor:  Colors.green.shade50,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.greenAccent.shade700,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: viewModel.passwordHidden,
                      decoration: InputDecoration(
                          fillColor:  Colors.green.shade50,
                          filled: true,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_clock_outlined,color:Colors.greenAccent.shade700),
                          suffixIcon: InkWell(
                              onTap: () {
                                viewModel.setPasswordHidden(
                                    !viewModel.passwordHidden);
                              },
                              child: Icon(viewModel.passwordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,color: Colors.greenAccent.shade700)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none)),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, loginViewMode, child) {
                    return InkWell(
                      onTap: () {
                        Users user =
                            Users(emailController.text, passwordController.text,"");
                        if (isUserInfoValid(user)) {
                          loginViewMode.login(context, user);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.shade700,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: loginViewMode.loading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Login",
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
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.ROUTE_SIGNUP_SCREEN);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don\'t Have an Account? "),
                      Text("Sign up",
                          style: TextStyle(
                              color: Colors.greenAccent.shade700, fontWeight: FontWeight.bold))
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
    }else{
      return true;
    }
  }
}
