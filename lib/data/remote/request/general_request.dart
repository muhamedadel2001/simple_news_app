import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../response/general_response/general_response.dart';

class GeneralRequest {
  Future generalRequest({required String apiKey}) async {
    try {
      Response response =
          await MyDio.getData(endPoint: topHeadLinesGeneral, query: {
        'apiKey': apiKey,
      });
      printTest('generalRequest${response.statusCode}');
      printResponse('generalResponse${response.data}');
      return GeneralResponse.fromJson(response.data);
    } catch (error) {
      printError('generalresponse$error');
    }
  }
}
