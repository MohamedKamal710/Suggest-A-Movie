import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:suggest_movie/classes/Genre.dart';
import 'package:suggest_movie/classes/Movie.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override

   int counter = 1;

  Map setupMovies(List<Movie> list) {
    Map<String,List<Movie>> moviesMap = {};
    List genres = Genre.values;
    genres.forEach((element) {
      String str = element.toString().substring(6,element.toString().length);
      moviesMap[str] = new List<Movie>();
    });

    list.forEach((elementMovie) {
      elementMovie.genre.forEach((element) {
        String genreName = element.toString().substring(6,element.toString().length);
        List temp = moviesMap[genreName].toList();
        temp.add(elementMovie);
        moviesMap[genreName] = temp;
      });

    });
    return moviesMap;
  }

  //function to choose a random movie
  void chooseRandomMovie(List movies,Map genres,Map result) async{
    List<String> temp =[];

    result.forEach((key, value) {
      if(result[key] == true){
        temp.add(key);
      }
    });
    int genresArrayLength = temp.length;
    Random randomNum = new Random();
    int myRandomNum = randomNum.nextInt(genresArrayLength); //random number in range 0 - List length

    List<Movie> movieTempList = genres[temp[myRandomNum]];
    int movieTempListLength = movieTempList.length;
    myRandomNum = randomNum.nextInt(movieTempListLength);

    Movie randomMovie = movieTempList[myRandomNum];
    await randomMovie.getImage();
    counter--;
    if(counter == 0)
       Navigator.pushReplacementNamed(context, '/movieCard',arguments: randomMovie);
  }

  List<Movie> movies = [Movie(movieName: 'Interstellar',directorName: 'Christopher Nolan' , rate: 8.6 , genre: [Genre.Sci_Fi,Genre.Adventure,Genre.Drama]),
    Movie(movieName: 'Inception',directorName: 'Christopher Nolan' , rate: 8.8 , genre: [Genre.Adventure,Genre.Action,Genre.Sci_Fi]),
    Movie(movieName: 'The Conjuring' , directorName: 'James Wan',rate: 7.5 , genre: [Genre.Horror,Genre.Thriller]),
    Movie(movieName: 'It',directorName: 'Andy Muschietti' , rate: 7.3 , genre: [Genre.Horror]),
    Movie(movieName: 'Shutter Island' , directorName: 'Martin Scorsese' , rate: 8.2 , genre: [Genre.Thriller]),
    Movie(movieName: 'Grown Ups' , directorName: 'Dennis Dugan' , rate: 5.9 , genre: [Genre.Comedy]),
    Movie(movieName: 'Gladiator',directorName: 'Ridley Scott' , rate: 8.5 , genre: [Genre.Thriller,Genre.Drama,Genre.Drama]),
    Movie(movieName: 'The Prestige' ,directorName: 'Christopher Nolan' , rate: 8.5 , genre: [Genre.Drama,Genre.Sci_Fi]),
    Movie(movieName: 'The Departed' , directorName: 'Martin Scorsese' , rate: 8.5 , genre: [Genre.Drama,Genre.Action,Genre.Crime]),
    Movie(movieName: 'Django Unchained' , directorName: 'Quentin Tarantino' , rate: 8.4, genre: [Genre.Drama]),
    Movie(movieName: 'Inglourious Basterds',directorName: 'Quentin Tarantino',rate: 8.3,genre: [Genre.Drama,Genre.Action]),
    Movie(movieName: 'Se7en' , directorName: 'David Fincher',rate: 8.6,genre: [Genre.Crime,Genre.Drama]),
    Movie(movieName: 'Forrest Gump' , directorName: 'Robert Zemeckis',rate: 8.8 , genre: [Genre.Drama,Genre.Romance]),
    Movie(movieName: 'Fantastic Beasts and Where to Find Them' , directorName: 'David Yates' , rate: 7.3 ,genre: [Genre.Fantasy,Genre.Adventure]),
  Movie(movieName: 'Avengers: Endgame' , directorName: 'Anthony Russo, Joe Russo',rate: 8.3 , genre: [Genre.Adventure,Genre.Drama,Genre.Action]),
  Movie(movieName: 'Hacksaw Ridge',directorName: 'Mel Gibson' ,rate: 8.1 , genre: [Genre.Drama]),
  Movie(movieName: 'Prisoners' , directorName: 'Denis Villeneuve' , rate: 8.1 , genre: [Genre.Drama,Genre.Crime]),
  Movie(movieName: 'Mad Max: Fury Road',directorName: 'George Miller' , rate: 8.1 ,genre: [Genre.Action,Genre.Adventure,Genre.Sci_Fi]),
  Movie(movieName: 'The Dark Knight',directorName: 'Christopher Nolan',rate: 9.0,genre: [Genre.Drama,Genre.Crime,Genre.Action]),
  Movie(movieName: 'Us',directorName: 'Jordan Peele',rate: 6.9,genre: [Genre.Thriller,Genre.Horror]),
  Movie(movieName: 'Get Out',directorName: 'Jordan Peele',rate: 7.7,genre: [Genre.Thriller,Genre.Horror]),
  Movie(movieName: 'The Conjuring 2',directorName: 'James Wan',rate: 7.3,genre: [Genre.Thriller,Genre.Horror]),
  Movie(movieName: 'Insidious',directorName: 'James Wan',rate: 6.8,genre: [Genre.Thriller,Genre.Horror]),
  Movie(movieName: 'The Hunt',directorName: 'Craig Zobel',rate: 6.5,genre: [Genre.Thriller,Genre.Horror,Genre.Action]),
    Movie(movieName: 'Ready Or Not',directorName: 'Matt Bettinelli-Olpin, Tyler Gillett',rate: 6.8,genre: [Genre.Comedy,Genre.Horror]),
    Movie(movieName: 'The Invisible Man',directorName: 'Leigh Whannell',rate: 7.1,genre: [Genre.Sci_Fi,Genre.Horror]),
    Movie(movieName: "Don't Breathe",directorName: 'Fede Alvarez',rate: 7.1,genre: [Genre.Thriller,Genre.Horror,Genre.Crime]),
    Movie(movieName: "Avengers: Infinity War ",directorName: 'Anthony Russo, Joe Russo',rate: 8.4,genre: [Genre.Action,Genre.Adventure,Genre.Sci_Fi]),
    Movie(movieName: "The Avengers",directorName: 'Joss Whedon',rate: 8 ,genre: [Genre.Action,Genre.Adventure,Genre.Sci_Fi]),
    Movie(movieName: "The Wolfman",directorName: 'Joe Johnston',rate: 5.8,genre: [Genre.Drama,Genre.Thriller,Genre.Horror,Genre.Crime]),
    Movie(movieName: "Tenet",directorName: 'Christopher Nolan',rate: 7.5,genre: [Genre.Thriller,Genre.Action,Genre.Sci_Fi]),
    Movie(movieName: "Joker",directorName: 'Todd Phillips',rate: 8.4,genre: [Genre.Crime,Genre.Drama,Genre.Thriller]),
    Movie(movieName: "1917",directorName: 'Sam Mendes',rate: 8.3,genre: [Genre.Drama,Genre.Thriller]),
    Movie(movieName: "Knives Out",directorName: 'Rian Johnson',rate: 7.9,genre: [Genre.Crime,Genre.Drama,Genre.Comedy]),
    Movie(movieName: "The Gentlemen",directorName: 'Guy Ritchie',rate: 7.8,genre: [Genre.Crime,Genre.Action,Genre.Comedy]),
    Movie(movieName: "Sherlock Holmes",directorName: 'Guy Ritchie',rate: 7.6,genre: [Genre.Adventure,Genre.Action])];


  Map map = {};
  Map comingData = {};
  @override
  void initState(){
    super.initState();
    map = setupMovies(movies);

  }
  Widget build(BuildContext context) {
    final Map result = ModalRoute.of(context).settings.arguments;
    chooseRandomMovie(movies, map,result);
    // Movie movie =
    // Future.delayed(Duration(milliseconds: 2000)).then((value) => Navigator.pushReplacementNamed(context, '/movieCard',arguments: movie));
    return Scaffold(
    backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SpinKitFadingCube(
          color: Colors.orange[300],
          size: 35,
        ),SizedBox(height: 20,),
          Center(child: Text("Loading",
            style: TextStyle(
                fontSize: 16,
                letterSpacing: 2,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.bold,
                color: Colors.orange[300]
            ),),),
          ],
      ),
    );
  }
}
