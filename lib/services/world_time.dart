import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime{

  String location;
  String time = "";
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.url, required this.location, required this.flag});

  //make request
  //Future, temporary placeholder value that lets dart know when an async function is complete.
  //This helps the await know when it's complete.

    Future<void> getTime() async {

    try{
      var myUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(myUrl);
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];

      //creating date time object
      DateTime now = DateTime.parse(datetime.substring(0,26));

      //ternary operator to see whether it's day or night
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;

      //formatting date time
      time = DateFormat.jm().format(now);

    }catch(e){
      print('Caught Error $e');
    }

  }

}