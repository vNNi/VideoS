import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video;
  VideoCell(this.video);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(video["imageUrl"]),
              Container(
                height: 10,
              ),
              Center(
                  child: Text(
                video["name"],
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
              Container(
                height: 10,
              ),
              Text(
                'Views: ' + video["numberOfViews"].toString(),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
