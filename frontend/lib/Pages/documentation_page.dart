import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'report_generated_page.dart';  // new page

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // … your existing AppBar/body here …

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // … Export buttons & preview …

            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // Preview PDF inline…
              },
              child: const Text("View report"),
            ),

            // <- UPDATED: Navigate to the “generated” page
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Here you would kick off your actual generation code…
                // then navigate to the “success + form” page:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReportGeneratedPage(),
                  ),
                );
              },
              child: const Text("Generate report"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
