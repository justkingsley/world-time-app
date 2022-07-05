import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime{

  String location;
  String time = "";
  String flag;
  String url;

  WorldTime({ required this.location, required this.flag, required this.url});

  //make request
  //Future, temporary placeholder value that lets dart know when an async function is complete.
  //This helps the await know when it's complete.

    Future<void> getTime() async {

    var myUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    var response = await http.get(myUrl);
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    //creating date time object
    DateTime now = DateTime.parse(datetime);

    //Converting String to int
    now = now.add(Duration(hours: int.parse(offset)));

    //setting time property
    time = now.toString();

  }

}