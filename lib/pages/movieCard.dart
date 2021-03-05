import 'dart:math';

import 'package:flutter/material.dart';
import 'package:suggest_movie/classes/Genre.dart';
import 'package:suggest_movie/classes/Movie.dart';
class movieCard extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


  Movie movie = ModalRoute.of(context).settings.arguments;

      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,20),
            child: Column(

              children: [Text("Chosen Movie"
              ,style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Play',
                  color: Colors.orange[600],
                  letterSpacing: 1
                ),),
                Divider(
                height: 20,
                color: Colors.grey[600],
              ),Container(
                alignment: Alignment.center,
                child: Image.network('http://image.tmdb.org/t/p/w500/'+ movie.networkImage),
                width: 300,
                  color: Colors.grey[850],
                  constraints: BoxConstraints(minWidth:double.infinity,maxHeight: 280),
              ),Divider(height: 20,
                  color: Colors.grey[800]),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: Text('NAME :',style: TextStyle(color: Colors.orange[800],fontSize: 20,letterSpacing: 2,fontFamily: 'Dosis',fontWeight: FontWeight.bold),),
                  ),
                SizedBox(width: 30,),
                    Flexible(
                      child: Text(movie.movieName
                      ,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'PTSansNarrow',
                        letterSpacing: 1
                      ),),
                    ),
                  ],
                ),SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text("DIRECTOR :", style: TextStyle(color: Colors.orange[800],fontSize: 19,letterSpacing: 2,fontFamily: 'Dosis',fontWeight: FontWeight.bold),),
                ),SizedBox(width: 30,),
                Flexible(
                  child: Text(movie.directorName,
                  style: TextStyle(
                    fontFamily: 'Dosis',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                  ),),
                )],),SizedBox(height: 30,),Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('RATE :' ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dosis',
                      color: Colors.orange[800],
                      letterSpacing: 2,
                    ), ),
                  ),SizedBox(width: 50,),
                  Text(movie.rate.toString(),
                  style: TextStyle(
                    fontFamily: 'Dosis',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    fontSize: 22
                  ),),SizedBox(width: 5,),Icon(Icons.star,color: Colors.orangeAccent,size: 24,)],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //     child: RaisedButton(
                //       onPressed: (){},
                //       child: Text("Close"),
                //     ),),
                //   ],
                // )
              ],

            ),
          ),
        ),
        ),
        bottomNavigationBar: FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: (Text('Close',style: TextStyle(fontSize: 22,fontFamily: 'Play',fontWeight: FontWeight.bold,color: Colors.grey[900]),)),
          color: Colors.orange[800],
          splashColor: Colors.orange[400],

        ),

    );
  }
}
