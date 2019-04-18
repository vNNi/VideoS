import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Repository {
  final String _url;
  Repository(this._url);

  Future fetchVideos() async {
    print(_url);
    print("http first get");
    final res = await http.get(Uri.parse(_url));
    print(res);
    if (res.statusCode == 200) {
      print("response on");
      final map = json.decode(res.body);
      return map["videos"];
    }else {
      throw new Error();
    }
  }
}
