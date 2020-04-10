import 'package:flutter/material.dart';
import 'package:worldclock/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Myanmar',flag: 'myanmar.jpg',url: 'Asia/Yangon');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home' , arguments: {
    'location' : instance.location,
     'flag': instance.flag,
     'time': instance.time,
      'isDayTime': instance.isDayTime,
    });


  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningCircle(
          color: Colors.blue[900],
          size: 50.0,
        ),
      )
    );
  }
}


