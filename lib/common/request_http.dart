import 'dart:async';
import 'package:here_weather_flutter/common/model/data_clase.dart';
import 'package:here_weather_flutter/common/model/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHandler{
  final String _baseURl = "weather.cit.api.here.com";
  Future<dynamic> getJson(Uri uri) async{

    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }
  Future<List<Media>> fetchMovies(){
    var uri = new Uri.https(_baseURl, "weather/1.0/report.json",{
      'product':"forecast_7days_simple",
      'name':defaultCity,
    'app_id':"d2Np3raEIq8FcComJGfL",
      'app_code':"dpe0hlBTbAXSpUDtMaqtEA"
    });
    print("${uri}");
    return getJson(uri).then(((data)=>
        data['dailyForecasts']['forecastLocation']['forecast'].map<Media>((item)=> new Media(item)).toList()
    ));
  }
}