import 'package:cached_network_image/cached_network_image.dart';
import 'package:doiapi_demo/Uploading_image/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProfileController profilerController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[

                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 40,
                ),
              ],
            ),
            child: SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Obx(() {
                    if (profilerController.isLoading.value) {
                      return const CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/no_user.jpg'),
                        child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )),
                      );
                    } else {
                      if (profilerController.imageURL.isNotEmpty) {
                        return CachedNetworkImage(
                          imageUrl: profilerController.imageURL,
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: imageProvider,
                              ),
                          placeholder: (context, url) =>
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/icons/no_user.jpg'),
                            child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        );
                      } else {
                        return const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/icons/no_user.jpg'),
                        );
                      }
                    }
                  }),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: TextButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera),
                                  title: const Text('Camera'),
                                  onTap: () {
                                    Get.back();
                                    profilerController
                                        .uploadImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text('Gallery'),
                                  onTap: () {
                                    Get.back();
                                    profilerController
                                        .uploadImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
