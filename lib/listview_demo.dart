import 'package:day3_ui/model/movie.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body:
          Container(
            child: createDynamicList(movieList),
          ),

      ),
    );
  }
//https://codesinsider.com/flutter-listview-example/#:~:text=Listview%20in%20flutter%20is%20a,items%20on%20the%20same%20screen.
   createListView(){

    return ListView(

      shrinkWrap: true,
       children:  [
          Card(
           elevation: 2,
           child: ListTile(
             onTap: (){ },
             leading: FlutterLogo(),
             title: Text("Item # 1"),
           ),
         ), Card(
           
           elevation: 5,
           child: ListTile(
             leading: FlutterLogo(),
             title: Text("Item # 2"),
           ),
         ),
         Card(
           elevation: 5,
           child: ListTile(
             leading: FlutterLogo(),
             title: Text("Item # 3"),
           ),
         ),
         Card(
           elevation: 5,
           child: ListTile(
             leading: FlutterLogo(),
             title: Text("Item # 4"),
           ),
         ),

       ],

    );

  }

  
  
   createDynamicList(List<Movie> movieList){

     return ListView.builder(
        shrinkWrap: true,
         itemCount: movieList.length,
         itemBuilder:(context, index) {

           return Card(
             child: InkWell(
               onTap: (){

                 print(movieList[index].name);

               },
               child: Row(
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Image.network(movieList[index].photoURL, width: 100,height: 100,fit:BoxFit.cover,),
                   Expanded(
                     child: Column(
                       mainAxisSize: MainAxisSize.max,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                             margin: EdgeInsets.all(10),
                             child: Text(movieList[index].name, style: TextStyle(fontSize: 20), textAlign: TextAlign.start ,)),
                         Container(
                             margin: EdgeInsets.all(10),
                             child: Text(movieList[index].description, maxLines: 10)),
                       ],
                     ),
                   )
                 ],
               ),
             ),
           );
         },
     );
    
   } 

}



