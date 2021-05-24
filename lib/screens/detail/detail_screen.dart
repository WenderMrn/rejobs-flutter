import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rejobs/models/job.dart';

class DetailScreen extends StatelessWidget {
  final Job job;

  DetailScreen({Key key, @required this.job}) : super(key: key);

  Widget backButton(context) {
    return Positioned(
      left: 8.0,
      top: 40.0,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Widget createImage(String url) {
    double height = 50, width = 50;
    return job.companyLogoUrl != null
        ? Image.network(job.companyLogoUrl, height: height, width: width)
        : Image.asset(
            "assets/work_grey.png",
            height: height,
            width: width,
            color: Colors.grey[200],
          );
  }

  Widget categoryAndSalary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            job.category,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              job.salary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget topContentText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 70.0),
        createImage(job.companyLogoUrl),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.teal[700]),
        ),
        SizedBox(height: 10.0),
        Text(
          job.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Expanded(child: SizedBox()),
        SizedBox(height: 5.0),
        categoryAndSalary()
      ],
    );
  }

  Widget backgroundImage(context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 300,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/meet.jpeg"),
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget backgroundColor(context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: Color.fromRGBO(0, 128, 128, 0.8784313725490196)),
      child: Center(
        child: topContentText(context),
      ),
    );
  }

  Widget topSection(context) {
    return Stack(
      children: <Widget>[
        backgroundImage(context),
        backgroundColor(context),
        backButton(context),
      ],
    );
  }

  Widget bottomSection() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  job.getPublishDateFormatted(),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                )),
            Html(data: job.description)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[topSection(context), bottomSection()],
      ),
    );
  }
}
