import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../utils/extensions/log_extensions.dart';
import '../../../tools/custom_exception.dart';

class ApiProvider{
  final Dio dio;

  ApiProvider({required this.dio});

  Future<Map<String, dynamic>> get(String endPoint) async {
    try {
      final Response response = await dio.get(
        endPoint,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.error.toString().loge();
      err.message.loge();
      throw FetchDataException("internetError");
    } catch (e){
      e.toString().loge();
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> getFromMap(String endPoint,Map<String, dynamic> params) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: params,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    } on Exception catch (err) {
      err.toString().loge();
      throw FetchDataException("internetError");
    } catch (e){
      e.toString().loge();
      throw FetchDataException("internetError");
    }
  }

    Future<List<dynamic>> getListFromMap(String endPoint,Map<String, dynamic> params,Map<String, dynamic>? headers) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: params,
      );
      final List<dynamic> responseData = jsonDecode(response.data)
      .map((item) => item as Map<String, dynamic>).toList();
      return responseData;
     } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> post(String endPoint, Map<String, dynamic> body, Map<String, dynamic>? headers) async {
    try {
      final Response response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    } on Exception catch (err) {
      err.toString().loge();
      throw FetchDataException("internetError");
    } catch (e){
      e.toString().loge();
      throw FetchDataException("internetError");
    }
  }

  Future<List<dynamic>> postList(String endPoint, Map<String, dynamic> body, Map<String, dynamic>? headers) async {
    try {
      final Response response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      final List<dynamic> responseData = response.data as List;
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    }
  }

  Map<String, dynamic> classifyResponse(Response response) {
    final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
      case 401:
        throw UnauthorisedException(responseData["error"].toString());
      case 500:
      case 501:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}