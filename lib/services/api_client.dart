import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import '../models/model.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.collectapi.com")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @GET("/weather/getWeather?data.lang=tr&data.city={city}")
  Future<Weather> splashData(@Path("city") String city);
}
