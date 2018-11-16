
class Media {
  String highTemperature ;
  String lowTemperature;
  String humidity;
  String windSpeed;
  String weekday;
  String skyDescription;
  String temperatureDesc;
  String iconLink;


  factory Media(Map jsonMap) {
    return new Media.deserialize(jsonMap);
  }
  Media.deserialize(Map json)
      :
        highTemperature =json["highTemperature"],
        lowTemperature = json ["lowTemperature"],
        humidity = json["humidity"],
        windSpeed = json["windSpeed"],
        weekday = json["weekday"],
        skyDescription = json["skyDescription"],
        temperatureDesc = json["temperatureDesc"],
  iconLink = json["iconLink"];

}
