import 'package:flutter/material.dart';
import './Widgets/video_cell.dart';
import './Repository/Repository.dart';

void main() => runApp(VideoList());

class VideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoListSatate();
  }
}

class _VideoListSatate extends State<VideoList> {
  bool _isLoading = false;
  var videos;
  final String _url = 'http://api.letsbuildthatapp.com/youtube/home_feed';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Video List App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: "Refresh to new videos",
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                 Repository(_url).fetchVideos().then((videosRes) {
                  setState(() {
                    videos = videosRes;
                    _isLoading = false;
                  });
                });
              },
            ),
          ],
        ),
        body: Center(
            child: _isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: this.videos != null ? this.videos.length : 0,
                    itemBuilder: (context, i) {
                      final video = videos[i];
                      return VideoCell(video);
                    },
                  )),
      ),
    );
  }
}
