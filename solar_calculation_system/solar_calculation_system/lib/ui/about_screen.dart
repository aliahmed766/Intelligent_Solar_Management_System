import 'package:flutter/material.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Company',
              style: TextStyle(
                fontSize: 24,
                color: Colors.greenAccent.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This application is crated by UAF IT Solutions. We are a passionate team dedicated to crafting innovative solutions that empower businesses and individuals alike. With a focus on creativity and excellence, we strive to deliver cutting-edge products and services tailored to meet the unique needs of our clients. Our commitment to quality and customer satisfaction drives everything we do, ensuring that we exceed expectations every step of the way.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contributors',
              style: TextStyle(
                color: Colors.greenAccent.shade700,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Following team members contributes in this project:-\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Usama\n- Hafiz Usama\n',
                style: TextStyle(
                  fontSize: 18
                ),
            ),
          ],
        ),
      ),
    );
  }
}
