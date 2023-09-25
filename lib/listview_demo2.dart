import 'dart:io';
import 'package:day3_ui/model/movie.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListScreen(),
    );
  }
}



class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);
  
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  var movieList=[
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
    Movie("The Shawshank Redemption", "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion", 1994, "https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg"),
  ];

   var indicator= false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{

          print("test");

          setState(() {
            indicator=true;
          });


          // we used Future here for simulating delay of getting data from API
         Future.delayed(Duration(seconds: 5), (){

           setState(() {
             var m=Movie("test", "test", 1111,"https://static1.srcdn.com/wordpress/wp-content/uploads/2020/10/Tim-Robbins-as-Andy-Dufresne-in-Shawshank-Redemption.jpg" );

             movieList.add(m);

             indicator=false;
           });

         });


        },

        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body:
      Column(
        children: [
          TextField(

            onChanged: (value) {
              print(value);

              var original=movieList;
               var newMovieList=original.where((element) => element.name.toString().contains(value));
              setState(() {
                movieList = newMovieList.toList();
              });

              if(newMovieList.length==0){
               setState(() {
                 movieList=original;
               });
              }
            },
            decoration:  InputDecoration(
      labelText: 'Search',

        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.search,
        ),
        ),
          ),
          Container(
            child: indicator==false? createDynamicList(movieList) : Center(child: SizedBox(
              width: 32,
              height: 32,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                  strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
              ),
            ),),
          ),
        ],
      ),

    );
  }
//https://codesinsider.com/flutter-listview-example/#:~:text=Listview%20in%20flutter%20is%20a,items%20on%20the%20same%20screen.
 



  createDynamicList(List<Movie> movieList) {
    return Expanded(
      child: ListView.builder(

          shrinkWrap: true,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  print(movieList[index].name);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(movieList[index].photoURL, width: 100,
                      height: 100,
                      fit: BoxFit.cover,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Text(movieList[index].name, style: TextStyle(
                                  fontSize: 20), textAlign: TextAlign.start,)),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                  movieList[index].description, maxLines: 10)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }



}









