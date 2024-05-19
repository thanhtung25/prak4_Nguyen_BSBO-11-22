import 'package:flutter/material.dart';
import 'package:myapp/DataList.dart';

class MyInheritWidget extends InheritedWidget{
  final List<Student> data;
  final Widget child;

   MyInheritWidget({required this.child,required this.data}) : super(child: child);

  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
    return oldWidget.data != data;
  }

  static MyInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritWidget>();
  }
}