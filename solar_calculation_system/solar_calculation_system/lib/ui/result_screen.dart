import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  int currentLoad = 0;
  int totalLoad = 0;
  bool isAcSystem = false;

  ResultScreen({super.key,
    required this.currentLoad,
    required this.totalLoad,
    required this.isAcSystem});

  @override
  State<ResultScreen> createState() =>
      _ResultScreenState(
          currentLoad: currentLoad,
          totalLoad: totalLoad,
          isAcSystem: isAcSystem);
}

class _ResultScreenState extends State<ResultScreen> {
  int currentLoad = 0;
  int totalLoad = 0;
  bool isAcSystem = false;

  var cf = 1.3;
  var ef = 0.8;
  var sv = 0,
      inverter = 0,
      bettery = 0,
      spanel = 0,
      cc = 0;

  _ResultScreenState({required this.currentLoad,
    required this.totalLoad,
    required this.isAcSystem});

  @override
  void initState() {
    super.initState();
    if (isAcSystem) {
      if (currentLoad > 5000) {
        sv = 96;
      } else if (currentLoad < 5000 && currentLoad >= 3000) {
        sv = 48;
      } else if (currentLoad < 3000 && currentLoad >= 900) {
        sv = 24;
      } else if (currentLoad < 900) {
        sv = 12;
      }
      inverter = ((currentLoad * cf) / ef).round();

      bettery = ((totalLoad * cf) / (0.8 * sv * ef)).round();
      if (totalLoad == 0) {
        spanel = (currentLoad * cf).round();
      } else {
        print("sv: $sv");
        print("battery: $bettery");
        print("cf: $cf");
        var topValue = (bettery * 0.8 * sv * cf);
        var bottomValue=(5.5 * ef);
        print("top: $topValue");
        print("bottom: $bottomValue");
        spanel =(topValue/bottomValue).round();
      }
      cc = (spanel * cf / sv).round();
    } else {
      sv = 12;
      bettery = ((totalLoad * cf) / (0.8 * sv * ef)).round();
      if(totalLoad==0){
        spanel = (currentLoad * cf).round();
      }else{
        spanel = ((bettery * 0.8 * sv * cf) / (5.5 * ef)).round();
      }
      cc = (spanel * cf / sv).round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Results"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border:
                Border.all(color: Colors.greenAccent.shade700, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/tp.webp")),
                      Column(
                        children: [
                          Text(
                            "LOAD",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$currentLoad WATT",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/SV.webp")),
                      Column(
                        children: [
                          Text(
                            "S.VOLTAGE",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$sv V",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  totalLoad != 0
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/bat.webp")),
                      Column(
                        children: [
                          Text(
                            "BATTERY",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$bettery AH",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  )
                      : SizedBox(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  isAcSystem
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/inv.webp")),
                      Column(
                        children: [
                          Text(
                            "INVERTER",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$inverter WATT",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  )
                      : SizedBox(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/CC.webp")),
                      Column(
                        children: [
                          Text(
                            "C.CONNECTOR",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$cc A",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/sp.webp")),
                      Column(
                        children: [
                          Text(
                            "SOLAR PANEL",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$spanel WATT",
                            style: TextStyle(
                                color: Colors.greenAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
