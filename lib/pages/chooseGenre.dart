import 'package:flutter/material.dart';
import 'package:suggest_movie/classes/Genre.dart';

class chooseGenre extends StatefulWidget {

  @override
  _chooseGenreState createState() => _chooseGenreState();
}

class _chooseGenreState extends State<chooseGenre> {
  List<Genre> genres = Genre.values;
  Map map = {};

  @override
  Widget build(BuildContext context) {
    if(map.isEmpty) {
      genres.forEach((element) {
        String str = element.toString().substring(6, element
            .toString()
            .length);
        map[str] = false;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 0),
          child: Text("Genre Selection"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: genres.length,
              itemBuilder: (context,index){
                String str = genres[index].toString().substring(6,genres[index].toString().length);
                return CheckboxListTile(
                    title: Text(str),
                    value: map[str],
                    onChanged: (bool val){
                      setState((){
                        map[str] = val;
                      });
                    },
                  );
              }

              ),
          ),
          Row(
           children: [Expanded(
             child: ButtonTheme(
               height: 45,
               child: FlatButton(
                 onPressed: (){
                   Navigator.pushReplacementNamed(context, '/Loading',arguments: map);
                 },
                 color: Colors.orange[400],
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [(Colors.orange[400]),(Colors.orange[600]),(Colors.orange[800]),(Colors.orange[600]),(Colors.orange[400])],
                      begin: Alignment.centerLeft
                          ,end: Alignment.centerRight),
                    ),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 400,maxHeight: 48),
                      alignment: Alignment.center,
                      child: Text("Next"
                        ,style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),),

                    ),
                  ),

              
               ),
             ),

           flex: 1
             ,)],
          )
        ],
      ),

    );
  }
}
