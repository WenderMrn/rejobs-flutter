import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rejobs/models/ResponseJobs.dart';

class JobService {
  static Future<ResponseJobs> getJobs({String search = ""}) async {
    Map<String, dynamic> params = {search: search};

    final response = await http.get(
      Uri.https('remotive.io', "api/remote-jobs", params),
    );

    if (response.statusCode == 200) {
      return ResponseJobs.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.toString());
      throw Exception('Failed to load jobs');
    }
  }
}
