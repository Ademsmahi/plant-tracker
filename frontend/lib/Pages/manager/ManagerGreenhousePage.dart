import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tracker/Pages/manager/manager_home_page.dart';

class ManagerGreenhousePage extends StatefulWidget {
  @override
  _ManagerGreenhousePageState createState() => _ManagerGreenhousePageState();
}

class _ManagerGreenhousePageState extends State<ManagerGreenhousePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController greenhouseNameController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward(); // Trigger the animation on screen load
  }

  void _handleContinue({bool skip = false}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ManagerHomePage(
          greenhouseName: skip ? null : greenhouseNameController.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    greenhouseNameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text("Add Greenhouse", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome to PlantTracker",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Monitor & control your greenhouses in real-time.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: greenhouseNameController,
                  decoration: InputDecoration(
                    labelText: "Greenhouse Name",
                    labelStyle: GoogleFonts.poppins(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _handleContinue(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Add Greenhouse", style: GoogleFonts.poppins()),
                ),
                TextButton(
                  onPressed: () => _handleContinue(skip: true),
                  child: Text(
                    "Continue without adding",
                    style: GoogleFonts.poppins(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
