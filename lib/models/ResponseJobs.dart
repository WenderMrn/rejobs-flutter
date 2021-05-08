import 'Job.dart';

class ResponseJobs {
  String s0LegalNotice;
  int jobCount;
  List<Job> jobs;

  ResponseJobs({this.s0LegalNotice, this.jobCount, this.jobs});

  ResponseJobs.fromJson(Map<String, dynamic> json) {
    s0LegalNotice = json['0-legal-notice'];
    jobCount = json['job-count'];
    if (json['jobs'] != null) {
      jobs = <Job>[];
      json['jobs'].forEach((v) {
        jobs.add(new Job.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0-legal-notice'] = this.s0LegalNotice;
    data['job-count'] = this.jobCount;
    if (this.jobs != null) {
      data['jobs'] = this.jobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
