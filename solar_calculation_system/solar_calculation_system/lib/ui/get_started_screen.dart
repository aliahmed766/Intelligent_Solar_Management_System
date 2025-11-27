import 'package:flutter/material.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Started"),
        ),
        drawer: const MyDrawer(),
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
                            image: AssetImage("assets/images/ac.gif")),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "AC System",
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
                          "In this system appliances (load) used are AC based. Solar panel generates DC current and conversions are done by invertor. This kind of system are commonly used where electricity (Wapda) is not available",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.ROUTE_CHOOSE_BACKUP_SCREEN,arguments: true);
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
                            image: AssetImage("assets/images/Sun2.gif")),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "DC System",
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
                          "In this system appliances (Load) used are DC based. Solar panel generates DC current and it’s used as DC so invertor isn’t required. This system is more efficient then AC because there is conversion losses from AC to DC.",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(
                                context, RouteNames.ROUTE_CHOOSE_BACKUP_SCREEN,arguments: false);
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
        ));
  }
}
