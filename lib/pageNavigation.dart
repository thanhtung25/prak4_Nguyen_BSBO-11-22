import 'package:flutter/material.dart';
import 'package:myapp/ListViewName.dart';
import 'package:myapp/ListView_Separated.dart';
import 'package:myapp/Screen_List.dart';
import 'package:myapp/homepage.dart';

// ignore: camel_case_types
class pageNavigation extends StatelessWidget {
  const pageNavigation ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Navigation"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body:  Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenList()));
                }, 
                child:const Text("Go to List")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewName()));
                }, 
                child:const Text("Go to ListView")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListViewSeparated()));
                }, 
                child:const Text("Go to ListView_Separated")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomePage()));
                }, 
                child:const Text("Back")
              ),
            ],
          ),
        ),
      ),
    );
  }
}