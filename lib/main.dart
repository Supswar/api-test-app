

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Map data;
  late List userData;

  Future postData() async{
     
      String? token = await Candidate().getToken();

     Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
     };
    
    http.Response response = await http.post(
      Uri.parse("http://13.68.210.77:8080/api/v1/ManagerRequest/GetContactPaged"),
      body: { 
      "UserData" : "1611", "SearchText": ""
      },
      headers:{
        'Authorization':'Bearer $token',
      });
      data = json.decode(response.body);
      setState(() {
        userData = data["data"];
      });
      debugPrint(userData.toString());
      
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.black),
          ),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),
      ),
    );
  }
}

  
  
  
  


  
   Candidate() {}

