import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
            child: createListView(),
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
}



