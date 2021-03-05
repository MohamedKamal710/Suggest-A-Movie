import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/movies.png'),
              fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 200,
              child: RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/chooseGenre');
              },
              color: Colors.orange[400],
              textColor: Colors.black,
                splashColor: Colors.orange[800],
               child: Ink(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [(Colors.orange[400]),(Colors.orange[600]),(Colors.orange[800])]
                   ,begin: Alignment.centerRight,
                   end: Alignment.centerLeft),
                   shape: BoxShape.circle,
                 ),
                 child: Container(
                   constraints: BoxConstraints(maxHeight: 200,maxWidth: 200),
                   alignment: Alignment.center,
                   child: Text("Suggest",
                     style: TextStyle(
                       fontSize:50,
                       color: Colors.grey[800],
                       fontFamily: 'PTSansNarrow',
                       fontWeight: FontWeight.bold,
                     ),),

                 ),
               ),

              // height: 200,
              // minWidth: 100,
              shape: CircleBorder(
                side: BorderSide(color: Colors.grey[200],width: 1),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }
}
