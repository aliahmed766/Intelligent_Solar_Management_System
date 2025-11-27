import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_calculation_system/model/device.dart';
import 'package:solar_calculation_system/prefrences/preference_manager.dart';
import 'package:solar_calculation_system/utils/utils.dart';

import '../../model/data_with_backup.dart';
import '../../model/data_without_backup.dart';
import '../../routeUtils/route_names.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    PreferenceManager.getUserEmail().then((value) => setState(() {
          userEmail = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.greenAccent.shade700),
          accountName: Padding(
            padding: const EdgeInsets.only(left: 5,top: 20),
            child: Text("User", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
          accountEmail: Text(userEmail,style: TextStyle(fontSize: 18)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.green.shade100,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home_filled),
          title: Text("Home"),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_HOME_SCREEN);
          },
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text("Get Started"),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_GET_STARTED_SCREEN);
          },
        ),  ListTile(
          leading: Icon(Icons.person),
          title: Text("Vendor"),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_VENDORS_SCREEN);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_support_rounded),
          title: Text("Contact Us"),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_CONTACT_US_SCREEN);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About"),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_ABOUT_US_SCREEN);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () async {
            PreferenceManager.logout();
            Navigator.pushReplacementNamed(
                context, RouteNames.ROUTE_LOGIN_SCREEN);
          },
        )
      ],
    ));
    ;
  }
}

class DataWithBackupListView extends StatelessWidget {
  int itemCount = 0;
  List<DataWithBackup> list = [];

  DataWithBackupListView(
      {super.key, required this.itemCount, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          DataWithBackup dataWithBackup = list[index];
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.greenAccent.shade700)),
                child: ListTile(
                  title: Text(
                    dataWithBackup.device,
                    style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity: ${dataWithBackup.quantity}"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Backup: ${dataWithBackup.backupHours} Hours"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}

class DataWithoutBackupListView extends StatelessWidget {
  int itemCount = 0;
  List<DataWithoutBackup> list = [];

  DataWithoutBackupListView(
      {super.key, required this.itemCount, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          DataWithoutBackup dataWithoutBackup = list[index];
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.greenAccent.shade700)),
                child: ListTile(
                  title: Text(
                    dataWithoutBackup.device,
                    style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Quantity: ${dataWithoutBackup.quantity}")],
                  ),
                ),
              ),
              SizedBox(height: 10,)
            ],
          );
        });
    ;
  }
}

var acDeviceList = [
  Device(0, "Select Device"),
  Device(55, "Ceiling Fan (36)"),
  Device(62, "Ceiling Fan (48)"),
  Device(70, "Ceiling Fan (56)"),
  Device(70, "Pedistal Fan(20)"),
  Device(80, "Pedistal Fan(22)"),
  Device(110, "Pedistal Fan(24)"),
  Device(115, "Pedistal Fan(26)"),
  Device(50, "Table/Bracket Fan (16)"),
  Device(65, "Table/Bracket Fan (18)"),
  Device(30, "Exhast (8)"),
  Device(35, "Exhast (10)"),
  Device(50, "Exhast (12)"),
  Device(65, "Exhast (16)"),
  Device(85, "Exhast (18)"),
  Device(140, "Exhast (24)"),
  Device(140, "Washing Machine (65Ltr)"),
  Device(175, "Washing Machine (85Ltr)"),
  Device(150, "Cloth Dryer"),
  Device(200, "Air Cooler"),
  Device(2000, "Fan Heater"),
  Device(800, "Quartz Heater"),
  Device(1200, "Halogen Heater"),
  Device(1000, "Carbon Fiber Heater"),
  Device(600, "Water Heater Rod (S)"),
  Device(1500, "Water Heater Rod (L)"),
  Device(1500, "Water Geyser (15Ltr)"),
  Device(2000, "Water Geyser (20Ltr)"),
  Device(105, "Refrigerator 7cu ft"),
  Device(115, "Refrigerator 8cu ft"),
  Device(120, "Refrigerator 10cu ft"),
  Device(125, "Refrigerator 12-14cu ft"),
  Device(150, "Refrigerator 15cu ft"),
  Device(170, "Refrigerator 16-18cu ft"),
  Device(100, "Water Dispenser"),
  Device(330, "Water Pump 0.37 HP"),
  Device(440, "Water Pump 0.50 HP"),
  Device(484, "Water Pump 0.75 HP"),
  Device(770, "Water Pump 1.00 HP"),
  Device(1100, "Water Pump 1.5 HP"),
  Device(1760, "Water Pump 2.0 HP"),
  Device(660, "Window A/C 0.75 Ton"),
  Device(1250, "Window A/C 1.0 Ton"),
  Device(1745, "Window A/C 1.5 Ton"),
  Device(1092, "Split A/C 1.0 Ton"),
  Device(1566, "Split A/C 1.5 Ton"),
  Device(1938, "Split A/C 2.0 Ton"),
  Device(660, "Inv Split A/C 1.0 Ton"),
  Device(970, "Inv Split A/C 1.5 Ton"),
  Device(1280, "Inv Split A/C 2.0 Ton"),
  Device(50, "LED TV 32"),
  Device(55, "LED TV 39"),
  Device(70, "LED TV 43"),
  Device(120, "LED TV 50"),
  Device(60, "Bulb 60w"),
  Device(100, "Bulb 100w"),
  Device(16, "Energy Saver 16w"),
  Device(24, "Energy Saver 24w"),
  Device(40, "Energy Saver 40w"),
  Device(80, "Energy Saver 80w"),
  Device(5, "LED Bulb 5w"),
  Device(10, "LED Bulb 10w"),
  Device(15, "LED Bulb 15w"),
  Device(20, "LED Bulb 20w"),
  Device(30, "LED Bulb 30w"),
  Device(40, "LED Bulb 40w"),
  Device(1600, "Microwave Oven"),
  Device(40, "Laptop Charger"),
  Device(350, "Desktop PC")
];
var dcDeviceList = [
  Device(0, "Select Device"),
  Device(18, "Ceiling Fan (36)"),
  Device(22, "Ceiling Fan (42)"),
  Device(24, "Ceiling Fan (48)"),
  Device(28, "Ceiling Fan (52)"),
  Device(30, "Ceiling Fan (56)"),
  Device(18, "Pedistal Fan(12)"),
  Device(24, "Pedistal Fan(16)"),
  Device(15, "Table/Bracket Fan (12)"),
  Device(16, "Table/Bracket Fan (16)"),
  Device(7, "Energy Saver 7w"),
  Device(9, "Energy Saver 9w"),
  Device(11, "Energy Saver 11w"),
  Device(15, "Energy Saver 15w"),
  Device(20, "Energy Saver 20w"),
  Device(25, "Energy Saver 25w"),
  Device(35, "Energy Saver 35w"),
  Device(3, "LED Bulb 3w"),
  Device(5, "LED Bulb 5w"),
  Device(7, "LED Bulb 7w"),
  Device(9, "LED Bulb 9w"),
  Device(12, "LED Bulb 12w"),
  Device(18, "LED Bulb 18w"),
  Device(28, "LED Bulb 28w"),
  Device(38, "LED Bulb 38w"),
  Device(380, "Washing Machine"),
  Device(190, "Cloth Dryer"),
  Device(40, "Water Pump Submercible"),
  Device(150, "Iron")
];

class AddDeviceWithBackupDialog extends StatefulWidget {
  Function callback;
  bool isAcSystem;

  AddDeviceWithBackupDialog(
      {super.key, required this.isAcSystem, required this.callback});

  @override
  State<AddDeviceWithBackupDialog> createState() =>
      _AddDeviceWithBackupDialogState(
          isAcSystem: isAcSystem, callback: this.callback);
}

class _AddDeviceWithBackupDialogState extends State<AddDeviceWithBackupDialog> {
  Function callback;
  bool isAcSystem;

  _AddDeviceWithBackupDialogState(
      {required this.isAcSystem, required this.callback});

  Device dropdownvalue = Device(0, "Select Device");

// List of items in our dropdown menu

  TextEditingController quantityController = TextEditingController();
  TextEditingController backupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = isAcSystem ? acDeviceList : dcDeviceList;
    return AlertDialog(
      title: Text("Add Device"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.greenAccent.shade700)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: DropdownButton(
                value: dropdownvalue.toString(),
                isExpanded: true,
                underline: SizedBox(),
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: list.map((Device device) {
                  return DropdownMenuItem(
                    value: device.name,
                    child: Text(
                      device.name,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (device) {
                  print("Info device" + device.toString());
                  setState(() {
                    var newDevice =
                        list.firstWhere((element) => element.name == device);
                    dropdownvalue = newDevice;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Quantity",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: TextFormField(
                controller: backupController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Backup Hours",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text("Add"),
          onPressed: () {
            var backupHour = backupController.text;
            var quantity = quantityController.text;
            if (isInfoValid(quantity, backupHour, dropdownvalue)) {
              var device = DataWithBackup(dropdownvalue.name,
                  int.parse(quantity), int.parse(backupHour),dropdownvalue.voltage);
              this.callback.call(device);
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}

bool isInfoValid(String quantity, String backupHour, Device dropdownvalue) {
  if (quantity.isEmpty) {
    Utils.showToast("Please Enter Quantity");
    return false;
  } else if (backupHour.isEmpty) {
    Utils.showToast("Please Enter Backup Hour");
    return false;
  } else if (dropdownvalue.name == "Select Device") {
    Utils.showToast("Please Select Device");
    return false;
  } else {
    return true;
  }
}

class AddDeviceWithoutBackupDialog extends StatefulWidget {
  Function callback;
  bool isAcSystem;

  AddDeviceWithoutBackupDialog(
      {super.key, required this.isAcSystem, required this.callback});

  @override
  State<AddDeviceWithoutBackupDialog> createState() =>
      _AddDeviceWithoutBackupDialogState(
          isAcSystem: isAcSystem, callback: this.callback);
}

class _AddDeviceWithoutBackupDialogState
    extends State<AddDeviceWithoutBackupDialog> {
  Function callback;
  bool isAcSystem;

  _AddDeviceWithoutBackupDialogState(
      {required this.isAcSystem, required this.callback});

  Device dropdownvalue = Device(0, "Select Device");

// List of items in our dropdown menu

  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = isAcSystem ? acDeviceList : dcDeviceList;
    return AlertDialog(
      title: Text("Add Device"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.greenAccent.shade700)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: DropdownButton(
                value: dropdownvalue.toString(),
                isExpanded: true,
                underline: SizedBox(),
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: list.map((Device device) {
                  return DropdownMenuItem(
                    value: device.name,
                    child: Text(
                      device.name,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (device) {
                  print("Info device" + device.toString());
                  setState(() {
                    var newDevice = list
                        .firstWhere((element) => element.name == device);
                    dropdownvalue = newDevice;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Quantity",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text("Add"),
          onPressed: () {
            var quantity = quantityController.text;
            if (isInfoValid(quantity, "0", dropdownvalue)) {
              var device =
                  DataWithoutBackup(dropdownvalue.name, int.parse(quantity),dropdownvalue.voltage);
              this.callback.call(device);
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
