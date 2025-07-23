import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/end_points.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class RetrofitClient {
  @factoryMethod
  factory RetrofitClient(Dio dio) = _RetrofitClient;
}
