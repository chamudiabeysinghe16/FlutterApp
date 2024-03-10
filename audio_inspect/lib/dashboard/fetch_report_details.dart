import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchReportDetails() async {
  // Replace with your Java backend endpoint
  final response = await http.get(Uri.parse(
      'http://your-java-backend/reports')); // Replace with your Java backend endpoint

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load report details');
  }
}
