import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerDetailPage extends StatelessWidget {
  final String workerName;

  const WorkerDetailPage({super.key, required this.workerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$workerName Details'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Details for $workerName',
          style: GoogleFonts.poppins(fontSize: 20),
        ),
      ),
    );
  }
}
