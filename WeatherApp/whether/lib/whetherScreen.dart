import 'package:flutter/material.dart';
import 'package:whether/model/httpHelp.dart';
import 'package:whether/model/whether.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController textController = TextEditingController();
  Weather result = Weather('', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
            'Weather App Flutter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage("https://i.postimg.cc/CxBqxf6q/bg-hero-day.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: textController,
                  style: TextStyle(
                      color: Colors.white), // Changing text color to white
                  decoration: InputDecoration(
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                        color: Colors
                            .white54), // Changing hint text color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white), // Adding border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white), // Adding border color
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getData,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              weatherRow('Place: ', result.name),
              weatherRow(
                  'Temperature: ', result.temperature.toStringAsFixed(2)),
              weatherRow('Feels Like: ', result.preceived.toStringAsFixed(2)),
              weatherRow('Pressure: ', result.pressure.toStringAsFixed(2)),
              weatherRow('Humidity: ', result.humidity.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(textController.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Adding a subtle shadow
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
