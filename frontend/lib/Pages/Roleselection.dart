import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Choose Your Role", style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoleButton(
              icon: Icons.engineering,
              label: "Manager",
              onTap: () => Navigator.pushNamed(context, '/managerAddGreenhouse'),
            ),
            SizedBox(height: 20),
            RoleButton(
              icon: Icons.person,
              label: "Worker",
              onTap: () => Navigator.pushNamed(context, '/waiting', arguments: "worker"),
            ),
            SizedBox(height: 20),
            RoleButton(
              icon: Icons.person,
              label: "Technician",
              onTap: () => Navigator.pushNamed(context, '/waiting', arguments: "technician"),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  RoleButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 30),
      label: Text(label, style: GoogleFonts.poppins(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
    );
  }
}
