import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:solar_calculation_system/model/data_with_backup.dart';
import 'package:solar_calculation_system/model/data_without_backup.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';
import 'package:solar_calculation_system/utils/utils.dart';

class CalculateSystemScreen extends StatefulWidget {
  bool isAcSystem = false;
  bool isWithBackup = false;

  CalculateSystemScreen(
      {super.key, required this.isAcSystem, required this.isWithBackup});

  @override
  State<CalculateSystemScreen> createState() => _CalculateSystemScreenState(
      isAcSystem: isAcSystem, isWithBackup: isWithBackup);
}

class _CalculateSystemScreenState extends State<CalculateSystemScreen> {
  bool isAcSystem = false;
  bool isWithBackup = false;

  _CalculateSystemScreenState(
      {required this.isAcSystem, required this.isWithBackup});

  List<DataWithBackup> dataWithBackupList = [];
  List<DataWithoutBackup> dataWithoutBackupList = [];

  @override
  Widget build(BuildContext context) {
    String name = isAcSystem ? "AC" : "DC";

    return Scaffold(
      appBar: AppBar(
        title:
            Text(isWithBackup ? "$name with Backup" : "$name without Backup"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: isWithBackup
                    ? DataWithBackupListView(
                        itemCount: dataWithBackupList.length,
                        list: dataWithBackupList)
                    : DataWithoutBackupListView(
                        itemCount: dataWithoutBackupList.length,
                        list: dataWithoutBackupList),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      isWithBackup
                          ? Utils.showWithBackupAddDeviceDialog(
                              context, isAcSystem, (DataWithBackup device) {
                              setState(() {
                                dataWithBackupList.add(device);
                              });
                            })
                          : Utils.showWithoutBackupAddDeviceDialog(
                              context, isAcSystem, (DataWithoutBackup device) {
                              setState(() {
                                dataWithoutBackupList.add(device);
                              });
                            });
                    },
                    child: Container(
                      width: 150,
                      height: 52,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent.shade700),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          "Add Device",
                          style: TextStyle(
                              color: Colors.greenAccent.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (isWithBackup) {
                        calculateLoadWithBackup(dataWithBackupList);
                      } else {
                        calculateLoadWithoutBackup(dataWithoutBackupList);
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 52,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent.shade700),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.greenAccent.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculateLoadWithoutBackup(
      List<DataWithoutBackup> dataWithoutBackupList) {
    var currentLoad = 0;
    var totalLoad = 0;
    dataWithoutBackupList.forEach((element) {
      var res = element.voltage * element.quantity;
      currentLoad = currentLoad + res;
    });
    Navigator.pushReplacementNamed(context, RouteNames.ROUTE_RESULTS_SCREEN, arguments: {
      "currentLoad": currentLoad,
      "totalLoad": totalLoad,
      "isAcSystem":isAcSystem
    });
  }

  void calculateLoadWithBackup(List<DataWithBackup> dataWithBackupList) {
    var currentLoad = 0;
    var totalLoad = 0;
    dataWithBackupList.forEach((element) {
      var res = element.voltage * element.quantity;
      currentLoad = currentLoad + res;
    });
    dataWithBackupList.forEach((element) {
      var res = element.voltage * element.quantity;
      var res2 = res * element.backupHours;
      totalLoad = totalLoad + res2;
    });
    print("currentLoad "+currentLoad.toString());
    Navigator.pushReplacementNamed(context, RouteNames.ROUTE_RESULTS_SCREEN, arguments: {
      "currentLoad": currentLoad,
      "totalLoad": totalLoad,
      "isAcSystem":isAcSystem
    });
  }
}
