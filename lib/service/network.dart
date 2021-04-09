import 'package:dio/dio.dart';

class Network {
  Future getUsers() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('https://api.github.com/users');
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
