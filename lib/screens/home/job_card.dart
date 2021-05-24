import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rejobs/models/job.dart';
import 'package:rejobs/widgets/create_image.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onClickCard;

  const JobCard({Key key, @required this.job, @required this.onClickCard})
      : super(key: key);

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 4),
      child: Text(text,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(color: Colors.teal, fontSize: 20)),
    );
  }

  Widget _subtitle(String category) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 4),
      child: Text(category,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w800)),
    );
  }

  Widget _detailText({String salary, String publishDate}) {
    return Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 8, left: 8, right: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 110,
            child: Text(salary.isNotEmpty ? salary : '\$ - uninformed',
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          ),
          Text(publishDate,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ]));
  }

  Widget _card() {
    return Card(
        margin: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CreateImage(imageUrl: job.companyLogoUrl),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(job.title),
                  _subtitle(job.category),
                  _detailText(
                      salary: job.salary,
                      publishDate: job.getPublishDateFormatted()),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClickCard();
        },
        child: _card());
  }
}
