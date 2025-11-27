import 'package:flutter/material.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';

class ChooseBackupScreen extends StatelessWidget {
  bool isAcCurrent = false;

  ChooseBackupScreen({super.key, required this.isAcCurrent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Backup"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.greenAccent.shade700)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                          width: double.infinity,
                          height: 200,
                          image: AssetImage("assets/images/ac_w_back2.jpg")),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        isAcCurrent ? "AC With Backup" : "DC With Backup",
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          isAcCurrent
                              ? "In this system Batteries are involved for storing power for cloudy days and night."
                              : "In this system Batteries are involved for storing power for cloudy days and night."),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RouteNames.ROUTE_CALCULATE_SYSTEM_SCREEN,arguments: {
                            "isAcSystem":isAcCurrent,
                            "isWithBackup": true
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 47,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent.shade700,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.greenAccent.shade700)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                          width: double.infinity,
                          height: 200,
                          image: AssetImage("assets/images/ac_wo_back_2.jpg")),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        isAcCurrent ? "AC Without Backup" : "DC Without Backup",
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          isAcCurrent
                              ? "No batteries are involved because backup are not required and are used where power is required in day Time (Peak Hours) like schools, offices and Tube well."
                              : "No batteries are involved because backup are not required and are used where power is required in day Time (Peak Hours) like schools, offices and Tube well."),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RouteNames.ROUTE_CALCULATE_SYSTEM_SCREEN,arguments: {
                            "isAcSystem":isAcCurrent,
                            "isWithBackup": false
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 47,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent.shade700,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
