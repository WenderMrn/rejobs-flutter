import 'package:intl/intl.dart';

class Job {
  final DateFormat _formatter = DateFormat('dd/MM/yyyy');

  int id;
  String url;
  String title;
  String companyName;
  String category;
  List<String> tags;
  String jobType;
  String publicationDate;
  String candidateRequiredLocation;
  String salary;
  String description;
  String companyLogoUrl;

  Job(
      {this.id,
      this.url,
      this.title,
      this.companyName,
      this.category,
      this.tags,
      this.jobType,
      this.publicationDate,
      this.candidateRequiredLocation,
      this.salary,
      this.description,
      this.companyLogoUrl});

  String getPublishDateFormatted() {
    if (this.publicationDate == null) return '-';
    return _formatter.format(DateTime.parse(this.publicationDate));
  }

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    companyName = json['company_name'];
    category = json["category"];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags.add(v.toString());
      });
    }
    jobType = json['job_type'];
    publicationDate = json['publication_date'];
    candidateRequiredLocation = json['candidate_required_location'];
    salary = json['salary'];
    description = json['description'];
    companyLogoUrl = json['company_logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['company_name'] = this.companyName;
    data['category'] = this.category;
    if (this.tags != null) {
      data['tags'] = this.tags.toList();
    }
    data['job_type'] = this.jobType;
    data['publication_date'] = this.publicationDate;
    data['candidate_required_location'] = this.candidateRequiredLocation;
    data['salary'] = this.salary;
    data['description'] = this.description;
    data['company_logo_url'] = this.companyLogoUrl;

    return data;
  }
}
