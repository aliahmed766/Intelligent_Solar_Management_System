import 'package:flutter/material.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                color: Colors.greenAccent.shade700,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email,color: Colors.greenAccent.shade700,),
              title: Text('Email',),
              subtitle: Text('solarcalculations054517@gmail.com')
            ),
            ListTile(
              leading: Icon(Icons.phone,color: Colors.greenAccent.shade700),
              title: Text('Phone'),
              subtitle: Text('+923045037674')
            ),
            ListTile(
              leading: Icon(Icons.location_on,color: Colors.greenAccent.shade700),
              title: Text('Address'),
              subtitle: Text('123 Main St, Chungi amar saddu, Lahore, Pakistan')
            ),
          ],
        ),
      ),
    );
  }
}
