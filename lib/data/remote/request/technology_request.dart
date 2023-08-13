import 'package:dio/dio.dart';
import 'package:newsapp/data/remote/response/technology_response/technology_response.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../response/health_response/health_response.dart';

class TechnologyRequest {
  Future technologyRequest({required String apiKey}) async {
    try {
      Response response =
          await MyDio.getData(endPoint: topHeadLinesTechnology, query: {
        'apiKey': apiKey,
      });
      printTest('technologyRequest${response.statusCode}');
      printResponse('technologyResponse${response.data}');
      return TechnologyResponse.fromJson(response.data);
    } catch (error) {
      printError('technologyResponse$error');
    }
  }
}
