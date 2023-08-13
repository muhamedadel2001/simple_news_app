import 'package:dio/dio.dart';
import 'package:newsapp/data/remote/response/sport_response/sport_response.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';

class SportRequest {
  Future sportRequest({required String apiKey}) async {
    try {
      Response response =
          await MyDio.getData(endPoint: topHeadLinesSport, query: {
        'apiKey': apiKey,
      });
      printTest('sportRequest${response.statusCode}');
      printResponse('sportResponse${response.data}');
      return SportResponse.fromJson(response.data);
    } catch (error) {
      printError('sportResponse$error');
    }
  }
}
