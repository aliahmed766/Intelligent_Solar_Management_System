import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showErrorDialog(
      BuildContext context, String title, String message) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [okButton],
          );
        });
  }

  static void showWithBackupAddDeviceDialog(BuildContext context,bool isAcSystem, Function callback) {
    showDialog(
        context: context,
        builder: (context) {
          return AddDeviceWithBackupDialog(isAcSystem: isAcSystem,callback: callback);
        });
  }
  static void showWithoutBackupAddDeviceDialog(BuildContext context, bool isAcSystem, Function callback) {
    showDialog(
        context: context,
        builder: (context) {
          return AddDeviceWithoutBackupDialog(isAcSystem: isAcSystem,callback: callback);
        });
  }
}
