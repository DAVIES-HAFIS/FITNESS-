import 'package:flutter/material.dart';
import 'package:global_fitness_app/data/waether.dart';

import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0.0, 0, 0.0);
  final TextEditingController  _location =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WEATHER'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 20),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      controller: _location,
                      decoration: InputDecoration(
                        hintText: 'Enter a city',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: getData,
                        ),
                      ),
                    ),
                  ),
                  weatherRow('place', result.name),
                  weatherRow('Description', result.description),
                  weatherRow('temperature', result.temperature.toStringAsFixed(2)),
                  weatherRow('percieved-temperature', result.percievedTemp.toStringAsFixed(2)),
                  weatherRow('pressure', result.pressure.toString()),
                  weatherRow('humidity', result.humidity.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future getData()async{
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(_location.text);
    setState(() {

    });
  }
  Widget weatherRow(String label, String value){
    Widget row =  Padding(padding: EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(label, style: TextStyle(fontSize: 20,color: Theme.of(context).hintColor),),
        ),
        Expanded(
          flex: 4,
          child: Text(value, style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor),),
        ),
      ],
    ),
    );
    return row;
  }
}
