// reports_screen.dart

import 'package:audio_inspect/dashboard/fetch_report_details.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late Future<Map<String, dynamic>> reportDetails;

  @override
  void initState() {
    super.initState();
    reportDetails = fetchReportDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: reportDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: Text('Report Details: ${snapshot.data}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
