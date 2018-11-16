import 'package:flutter/material.dart';
import 'common/request_http.dart';
import 'common/model/data_clase.dart';


class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  void loadMovies() async {

    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: new Stack(
        children: <Widget>[
          new ListView.builder(
              itemCount: _media.length,
              itemBuilder: (BuildContext context, int index) {
                return new Stack(
                  children: <Widget>[
                    new Container(
                      width: 340.0,
                      margin: const EdgeInsets.only(left: 16.0),
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: new Color(0xFF333366),
                          borderRadius: new BorderRadius.circular(8.0),
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                                color: Colors.green,
                                offset: new Offset(0.0, 4.0),
                                blurRadius: 5.0)
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.symmetric(vertical: 30.0),
                            alignment: FractionalOffset.centerLeft,
                            child: new Image.network(
                                "${_media[index].iconLink}",
                                height: 50.0,
                                width: 50.0),
                          ),
                              new Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                      "Temp max : ${_media[index].highTemperature}",style: ColorData()),
                                  new Text(
                                      "Temp min : ${_media[index].lowTemperature}",style: ColorData()),
                                  new Text("Humedad : ${_media[index].humidity}",style: ColorData()),
                                  new Text(
                                      "Velocidad de Viento : ${_media[index].windSpeed}",style: ColorData()),
                                  new Text(
                                    "Temp descripción : ${_media[index].temperatureDesc}",style: ColorData(),),
                                  new Text(
                                      "Desc. cielo : ${_media[index].skyDescription}",style: ColorData()),
                                  new Text("Dia : ${_media[index].weekday}",style: ColorData()),

                                ],
                              )

                        ],
                      ),
                    ),
                    new Divider(height: 120.0)
                  ],
                );
              }),
        ],
      ),
      );
  }

}


TextStyle ColorData(){
  return new TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: 14.0);

}
