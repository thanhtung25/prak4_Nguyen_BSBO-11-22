import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: camel_case_types
class RoutedNavigation extends StatelessWidget {
  const RoutedNavigation ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Routed Navigation"),
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
                onPressed: ()=> context.go('/RoutedNavigation/list'), 
                child:const Text("Go to List")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: ()=> context.go('/RoutedNavigation/listview'), 
                child:const Text("Go to ListView")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: ()=> context.go('/RoutedNavigation/listviewseparated'), 
                child:const Text("Go to ListView_Separated")
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                onPressed: ()=> context.go('/'), 
                child:const Text("back")
              ),
            ],
          ),
        ),
      ),
    );
  }
}