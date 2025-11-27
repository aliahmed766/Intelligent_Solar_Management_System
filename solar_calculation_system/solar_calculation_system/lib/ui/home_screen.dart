import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solar_calculation_system/prefrences/preference_manager.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                        image: AssetImage("assets/images/solar.webp")),
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green.shade300.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'It’s all about making people\'s life easy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Calculate your own system according to your needs by simple device selection along with quantity and backup hours in case of backup needed.',
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, RouteNames.ROUTE_GET_STARTED_SCREEN);
                                },
                                child: Container(
                                  width: 150,
                                  height: 52,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: Center(
                                    child: Text(
                                      "Let\'s Begin",
                                      style: TextStyle(
                                          color: Colors.greenAccent.shade700,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '3 Steps',
                style: TextStyle(
                  color: Colors.greenAccent.shade700,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage("assets/images/service_icon_1.png"),
                width: double.infinity,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Easy to Use',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.greenAccent.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Selection of System Type with default (Optional).',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage("assets/images/service_icon_2.png"),
                width: double.infinity,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Devic Selection',
                style: TextStyle(
                  color: Colors.greenAccent.shade700,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Simple device selection (Home Appliances).',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage("assets/images/service_icon_3.png"),
                width: double.infinity,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Optimal Results',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.greenAccent.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'System will generate optimal results\naccording to the requirements by user.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

