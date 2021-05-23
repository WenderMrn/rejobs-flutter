import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;

  ImageNetwork({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 8),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: imageUrl != null
                ? NetworkImage(imageUrl)
                : AssetImage("assets/work_grey.png")),
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }
}
