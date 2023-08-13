import 'package:dio/dio.dart';
import 'package:newsapp/data/remote/response/health_response/health_response.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';

class HealthRequest {
  Future healthRequest({required String apiKey}) async {
    try {
      Response response = await MyDio.getData(
          endPoint: topHeadLinesHealth, query: {'apiKey': apiKey,});
      printTest('healthRequest${response.statusCode}');
      printResponse('healthResponse${response.data}');
      return HealthResponse.fromJson(response.data);
    } catch (error) {
      printError('healthresponse$error');
    }
  }
}