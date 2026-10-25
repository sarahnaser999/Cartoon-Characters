import 'package:dio/dio.dart';
import 'package:omar_st_b/contants/strings.dart';

class CharactersWebServies {
  late Dio dio;
  CharactersWebServies() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCarachters() async {
    try {
      Response response = await dio.get("character");
      print(response.data.toString());
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
