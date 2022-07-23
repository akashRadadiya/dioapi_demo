import 'package:doiapi_demo/PostUserdata/post_Api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}
class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Welcome"),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      Get.to(const PostMethodPage());
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      size: 20,
                    ),
                    label: const Text("LogOut")),
              ],
            ),
          )),
    );
  }
}
