
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Student {
  String name;
  String classroom;

  Student({
    required this.name,
    required this.classroom
  });
  
  static List<Student> items = [
    Student( name: 'Tung', classroom: 'BSBO-11-22'),
    Student( name: 'Quang', classroom: 'BSBO-10-22'),
    Student( name: 'Khai', classroom: 'BSBO-11-22'),
    Student( name: 'Chien', classroom: 'BSBO-11-22'),
    Student( name: 'Bao', classroom: 'BSBO-10-22'),
];
}



