import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location,url,time,flag;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});
  Future getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String utctime = data['utc_datetime'];
      String utcoffset = data['utc_offset'].substring(1,3);
      String utcmin = data['utc_offset'].substring(4,6);
      String sign = data['utc_offset'].substring(0,1);
      DateTime now = DateTime.parse(utctime);

      if(sign == "+"){
        now = now.add(Duration(hours: int.parse(utcoffset),minutes: int.parse(utcmin)));
      }
      else{
        now = now.subtract(Duration(hours: int.parse(utcoffset),minutes: int.parse(utcmin)));
      }
      isDayTime = 6 < now.hour && now.hour< 20 ? true : false;
      time = DateFormat.jm().format(now);
//      bgImage = data['isDayTime'] ? 'day.png': 'night.png';
      }
    catch(e){
//      print('error $e');
      time = '$e';
//      time = 'could not get time data';
    }


  }

}
