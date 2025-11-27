import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_calculation_system/firebase_options.dart';
import 'package:solar_calculation_system/routeUtils/route.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/viewmodel/login_view_model.dart';
import 'package:solar_calculation_system/viewmodel/sign_up_view_model.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginViewModel()),
        ChangeNotifierProvider(create: (context)=> SignUpViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.ROUTE_SPLASH_SCREEN,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
