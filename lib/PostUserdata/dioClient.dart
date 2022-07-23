import 'package:dio/dio.dart';
import 'package:doiapi_demo/getMethod/userModel.dart';
class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://reqres.in/api/";
  // Future<User?> getUser({required String id}) async {
  //   User? user;
  //   try {
  //     Response userData = await _dio.get(_baseUrl + '/users/$id');
  //     print('User Info: ${userData.data}');
  //     user = User.fromJson(userData.data);
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   return user;
  // }
  Future<User> getUser({required String id}) async {
    // Perform GET request to the endpoint "/users/<id>"
    Response userData = await _dio.get(_baseUrl + 'users/$id');

    // Prints the raw data returned by the server
    print('User Info: ${userData.data}');

    // Parsing the raw JSON data to the User class
    User user = User.fromJson(userData.data);

    return user;
  }
  // Future<void> login() async {
  //   if (LoginPass.text.isNotEmpty && LoginEmail.text.isNotEmpty) {
  //     var response = await Dio.post(Uri.parse("https://reqres.in/api/login"),
  //         body: ({
  //           'email': LoginEmail.text,
  //           'password': LoginPass.text
  //         }));
  //     if (response.statusCode == 200) {
  //       Get.to(const Second());
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content:  Text("Invalid Credencial.")));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("blank Field Not Allowed")));
  //   }
  // }
}