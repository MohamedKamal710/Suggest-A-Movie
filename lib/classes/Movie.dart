import 'package:suggest_movie/classes/Genre.dart';
import 'dart:convert';
import 'package:http/http.dart';
class Movie {

  String movieName;

  String directorName;
  double rate;
  List<Genre> genre;
  String networkImage;

  Movie(
      {this.movieName, this.directorName, this.rate, this.genre});

  void getImage() async {
    await getCover().then((value) => networkImage = value);
  }

  Future<String> getCover() async {
    Response response = await get(
        'https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=$movieName&callback=?');
    if (response.statusCode == 200) {
      String str = response.body;
      String subText = str.substring(2, str.length - 1);
      Map map = jsonDecode(subText);
      List minMap = map['results'];
      Map last = minMap[0];
      String toRet = last['poster_path'];
      ;
      return toRet;
    } else {
      print(response.statusCode);
    }
  }
}