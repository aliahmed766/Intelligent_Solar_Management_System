import 'package:flutter/material.dart';
import 'package:solar_calculation_system/model/vendors.dart';
import 'package:solar_calculation_system/ui/ui_components/components.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Vendor> vendors = [
      Vendor("Zahid", "Lahore", "Shop no 2, Hall Road Lahore","03224346878"),
      Vendor("Zain", "Muree", "Shop no 12, Mall Road Muree","0321356878"),
      Vendor("Ali", "Lahore", "Shop no 2, Hall Road Lahore","03023566878"),
      Vendor("Qaisar", "Karachi", "Shop no 8, Nazimabad Karchi","0332836878"),
      Vendor("Hassan", "Islamabad", "Shop no 87, Market Lahore","034233256878"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendors"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              var vendor = vendors[index];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:  Colors.green.shade50
                          ,borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      trailing: Text(vendor.area,),
                      title: Text(
                        vendor.name,
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Number: ${vendor.number}"),
                          Text("Address: ${vendor.address}")
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade700,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              );
            }),
      ),
    );
  }
}
