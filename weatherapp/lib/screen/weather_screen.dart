import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  var date = DateTime.now();

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.near_me)
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.location_searching),
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset('image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150.0,
                      ),
                      Text(
                        'Seoul',
                        style: GoogleFonts.lato(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic(
                              (Duration(minutes: 1)),
                              builder: (context){
                                print('${getSystemTime()}');
                                return Text(
                                  '${getSystemTime()}',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white
                                  ),
                                );
                              }
                          ),
                          Text(
                            DateFormat(' - EEEE, ').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            DateFormat('d MMM, yyy').format(date),
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Seoul',
                        style: GoogleFonts.lato(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
