import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rejobs/models/response_jobs.dart';

class JobService {
  static Future<ResponseJobs> getJobs(
      {String search = "",
      String category = "",
      String companyName = ""}) async {
    Map<String, dynamic> params = {
      "search": search,
      "category": category,
      "company_name": companyName
    };

    final response = await http.get(
      Uri.https('remotive.io', "api/remote-jobs", params),
    );

    if (response.statusCode != 200) {
      debugPrint(response.toString());
      throw Exception('Failed to load jobs');
    }

    return ResponseJobs.fromJson(jsonDecode(response.body));
  }
}
