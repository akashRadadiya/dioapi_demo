import 'package:dio/dio.dart';
import 'package:doiapi_demo/PostUserdata/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostMethodPage extends StatefulWidget {
  const PostMethodPage({Key? key}) : super(key: key);

  @override
  State<PostMethodPage> createState() => _PostMethodPageState();
}

class _PostMethodPageState extends State<PostMethodPage> {
  final Dio _dio = Dio();
  final _baseUrl = 'https://reqres.in/';

  var LoginEmail = TextEditingController();
  var LoginPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HTTP Post_Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: LoginEmail,
                decoration: const InputDecoration(
                    labelText: "eve.holt@reqres.in",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: LoginPass,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password)),
              ),
              const SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    login();
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login")),
            ],
          ),
        )),
      ),
    );
  }

  Future<void> login() async {
    if (LoginPass.text.isNotEmpty && LoginEmail.text.isNotEmpty) {
      var response = await _dio.post('${_baseUrl}api/login',
          data: {"email": LoginEmail.text, "password": LoginPass.text});

      if (response.statusCode == 200) {
        Get.to(const Second());
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid Credentials.")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("blank Field Not Allowed")));
    }
  }
}
