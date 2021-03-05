import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushNamed(context, '/Home'));
     return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Center(
            child: Text("Movies Suggestion",
            style: TextStyle(
              fontSize: 40,
              fontFamily:'PTSansNarrow',
              color: Colors.orange[400]

            ),),
          ),

        ),
          Divider(color: Colors.grey[700],height: 40,),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.fromLTRB(33,0,33,0),
            child: Text(
              "This application suggests a random movie  according to your genre preferences.      The idea behind this application is to save time while searching for a movie .",
              style: TextStyle(fontSize: 18,
              color: Colors.grey[400]),
            ),
          ),
          SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child: SpinKitThreeBounce(
              color: Colors.orange[300],
              size: 20,
            ),
          ),
          Divider(height: 30,color: Colors.grey[700],),
         SizedBox(height: 20,),
        ],
      ),
    );
  }
}
