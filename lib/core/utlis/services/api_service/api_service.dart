import 'package:dio/dio.dart';

class APIService {
  final Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    String? token,
    String? contentType,
    Map<String, dynamic>? headers
  }) async{
    Response response = await dio.post(
        url,
        data: body,
      options: Options(
        contentType: contentType,
        headers: headers != null? headers : (token!= null? {
          'Authorization': 'Bearer $token',
        } : null),
      )
    );
    return response;
  }
}