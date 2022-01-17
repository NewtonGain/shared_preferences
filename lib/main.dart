import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferencess/welcome_page.dart';

import 'home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared preferences'),
            ),
            body: Center(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: ()async{
                bool alredyVisited = await getVisitingTag();
                if (alredyVisited !=null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                }

              },
               child: Text('Click Here'),),
              ],
            ),
         ),
       ),
    );
  }
}
Future setVisitingTag()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(('Visited'),true);
}
Future getVisitingTag()async{
  SharedPreferences sharedPrreferences =await SharedPreferences.getInstance();
bool alredyVisited= sharedPrreferences.getBool('Visited')?? false;

}