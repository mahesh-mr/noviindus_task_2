import 'package:dio/dio.dart';

class DioClint {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://the-flutter-case-prod.noviindus.in/api/",
    ),
  );
}
