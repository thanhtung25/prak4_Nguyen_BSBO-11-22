

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myapp/model/ApiStudent.dart';


class ApiServiceProvider {
  Future<ApiStudent> getUser() async{
    Uri uri = Uri.parse('https://reqres.in/api/users');
    final response = await http.get(uri);
    if(response.statusCode == 200){
      return ApiStudent.fromJson(json.decode(response.body));
    }else{
      throw Exception("failed to load Api");
    }
  }
}