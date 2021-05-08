import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rejobs/models/Job.dart';
import 'package:rejobs/models/ResponseJobs.dart';
import 'package:rejobs/screens/home/JobCard.dart';
import 'package:rejobs/screens/home/JobFilter.dart';
import 'package:rejobs/services/JobService.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {
  Future<ResponseJobs> featureResponseJobs;

  @override
  void initState() {
    super.initState();
    featureResponseJobs = JobService.getJobs();
  }

  Widget _jobsList() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 16, left: 4, right: 4, bottom: 16),
            child: FutureBuilder<ResponseJobs>(
              future: featureResponseJobs,
              builder: (context, snapshot) {
                debugPrint("Erro: " + snapshot.error.toString());
                debugPrint("Success: " + snapshot.toString());
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Job> jobs = snapshot.data.jobs;

                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        Job job = jobs[index];
                        return JobCard(
                            job: job,
                            onClickCard: () => debugPrint('click on card'));
                      },
                      itemCount: jobs == null ? 0 : jobs.length,
                    );
                  }
                  return Text("jobs not found.");
                } else {
                  return CircularProgressIndicator();
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
              onAdvancedSearch: () => debugPrint("on advanced filter"),
              onSubmit: (text) => {debugPrint("on submit search $text")},
            ),
            _jobsList()
          ],
        ),
      ),
    );
  }
}
