import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rejobs/models/job.dart';
import 'package:rejobs/models/response_jobs.dart';
import 'package:rejobs/screens/detail/detail_screen.dart';
import 'package:rejobs/screens/home/job_card.dart';
import 'package:rejobs/screens/home/job_filter.dart';
import 'package:rejobs/services/job_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {
  Future<ResponseJobs> featureResponseJobs;

  searchJobs({String search = ""}) {
    setState(() {
      featureResponseJobs = JobService.getJobs(search: search);
    });
  }

  @override
  void initState() {
    super.initState();
    searchJobs();
  }

  goToDetailJob(Job job) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailScreen(job: job)));
  }

  Widget _jobsList() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 16, left: 4, right: 4, bottom: 16),
            child: FutureBuilder<ResponseJobs>(
              future: featureResponseJobs,
              builder: (context, snapshot) {
                debugPrint("Error: " + snapshot.error.toString());
                debugPrint("Success: " + snapshot.toString());
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Job> jobs = snapshot.data.jobs;

                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        Job job = jobs[index];
                        return JobCard(
                            job: job, onClickCard: () => {goToDetailJob(job)});
                      },
                      itemCount: jobs == null ? 0 : jobs.length,
                    );
                  }
                  return Text("jobs not found.");
                } else {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Remote Jobs"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            JobFilter(
              onAdvancedSearch: () => {debugPrint("on advanced filter")},
              onSubmit: (text) => {
                searchJobs(search: text),
                debugPrint("on submit search $text")
              },
            ),
            _jobsList()
          ],
        ),
      ),
    );
  }
}
