import 'dart:io';
import 'package:dio/dio.dart';

class ImageService {
  static Future<dynamic> uploadFile(filePath) async {
    try {
      FormData formData = FormData.fromMap(
          {"image": await MultipartFile.fromFile(filePath, filename: "dp")});
      Response response = await Dio().post(
        "https://api.imgur.com/3/upload",
        data: formData,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {}
  }

/*
  Future<String> uploadFile(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    var response = await Dio().post("https://api.imgur.com/3/upload", data: formData);
    return response.data['id'];
  }*/
}

