import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/manager/ManagerGreenhousePage.dart';
import 'Pages/Splashscreen.dart';
import 'Pages/Loginpage.dart';
import 'Pages/WaitingScreen.dart';
import 'Pages/manager/manager_home_page.dart';
import 'Pages/signuppage.dart';
import 'Pages/Roleselection.dart';
import 'Pages/List_workers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Tracker',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(), // Use Google Fonts
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: Colors.green,
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/roles': (context) => RoleSelectionPage(),
        '/managerAddGreenhouse': (context) => ManagerGreenhousePage(),
        '/managerHome': (context) => ManagerHomePage(),
        '/workers_by_greenhouse': (context) => WorkersByGreenhousePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/waiting') {
          final role = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => WaitingScreen(role: role),
          );
        }
        return null;
      },
    );
  }
}
