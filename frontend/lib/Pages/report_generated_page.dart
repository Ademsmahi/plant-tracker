import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportGeneratedPage extends StatefulWidget {
  @override
  _ReportGeneratedPageState createState() => _ReportGeneratedPageState();
}

class _ReportGeneratedPageState extends State<ReportGeneratedPage> {
  final _formKey = GlobalKey<FormState>();
  final _reportNameController = TextEditingController();
  final _commentsController   = TextEditingController();

  @override
  void dispose() {
    _reportNameController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // TODO: send these details to your backend or handle in-app
      final name = _reportNameController.text;
      final comments = _commentsController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report ‘$name’ submitted!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Generated", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Your report was generated successfully!\n"
                    "Give it a name and add any comments below:",
                style: GoogleFonts.poppins(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _reportNameController,
                decoration: InputDecoration(
                  labelText: "Report Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (v) =>
                v == null || v.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _commentsController,
                decoration: InputDecoration(
                  labelText: "Comments",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Submit", style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
