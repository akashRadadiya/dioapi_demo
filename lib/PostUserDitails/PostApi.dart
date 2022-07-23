// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doiapi_demo/PostUserDitails/PostApimodel.dart';
import 'package:flutter/material.dart';

class postApiDemo extends StatefulWidget {
  const postApiDemo({Key? key}) : super(key: key);

  @override
  _postApiDemoState createState() => _postApiDemoState();
}
class _postApiDemoState extends State<postApiDemo> {

final Dio _dio = Dio();

final _baseUrl = 'https://reqres.in/';

  late DataModel _dataModel;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dio Post_Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                    hintText: 'UseeName'
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: jobcontroller,
                decoration: const InputDecoration(

                    hintText: 'Job Title'
                ),
              ),
              const SizedBox(height: 40,),

              ElevatedButton(onPressed: () async {

                String name = usernamecontroller.text;
                String job = jobcontroller.text;

                DataModel? data = await submitData(name,job);

                setState((){
                  _dataModel = data!;
                });

              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }


  Future<DataModel?> submitData (String name, String job) async {
    var responce = await _dio.post(_baseUrl + 'api/users',
        data: {"name": usernamecontroller.text, "job": jobcontroller.text});

    var Data = responce.data;
    // print(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:  Text(Data)),
    );
    if(
    responce.statusCode == 201
    ){
      String responceString = responce.data;
      DataModel.fromJson(responceString);
    }else{
      return null;
    }
  }
}