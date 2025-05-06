import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('user_token');
      final role = prefs.getString('user_role');
      final id = prefs.getString('user_id');
      if(token != null) {
        if (role == 'gestionnaire') {
          Navigator.pushReplacementNamed(context, '/managerHome');
        } else if (role == 'technicien') {
          //TODO navigate to technicien
        } else if (role == "agriculteur"){
          //TODO navigate to agriculteur
        }
      }else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/plantTracker.png',  height: MediaQuery.of(context).size.height * 0.25,),
            SizedBox(height: 10),
            Text(
              'PlantTracker',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(
              'Track your greenhouse anytime, anywhere.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
