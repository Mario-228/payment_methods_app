import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();
  Future<Response> postData({
    required Map<String, dynamic> parameters,
    required String url,
    required String token,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      url,
      queryParameters: parameters,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              "Authorization": "Bearer $token",
            },
      ),
    );
    return response;
  }
}
