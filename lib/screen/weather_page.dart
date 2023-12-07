// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:weather/weather.dart';
// import 'package:weatherapp/const_api.dart';

// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});

//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

//   //a variable that is going to store information for the weather that we get from the openweather api key for the specific location
//   Weather? _weather;
//   @override
//   void initState() {
//     super.initState();
//     _wf.currentWeatherByCityName("Bankura").then((w) {
//       setState(() {
//         _weather = w;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(),
//     );
//   }

//   Widget _buildUI() {
//     if (_weather == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       height: MediaQuery.sizeOf(context).height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           _locationheader(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.08,
//           ),
//           _datetimeInfo(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.05,
//           ),
//           _weatherIcon(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.02,
//           ),
//           _currenttemperature(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.02,
//           ),
//           _extractinformation(),
//         ],
//       ),
//     );
//   }

// /* widget used to display the area name related to weather information */
//   Widget _locationheader() {
//     return Text(
//       _weather?.areaName ?? "",
//       style: const TextStyle(fontSize: 22),
//     );
//   }

//   Widget _datetimeInfo() {
//     DateTime now = _weather!.date!;
//     return Column(
//       children: [
//         Text(
//           DateFormat(
//             "h:mm a",
//           ).format(now),
//           style: const TextStyle(fontSize: 18),
//         ),
//         /*  This part creates a DateFormat object with a specific format pattern "h:mm a" representing hours (h), minutes (mm), and AM/PM (a) */
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               DateFormat(
//                 "EEEE",
//               ).format(now),
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               " ${DateFormat("d.M.y").format(now)}",
//               style: const TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   //Weather icon
//   Widget _weatherIcon() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Container(
//           height: MediaQuery.sizeOf(context).height * 0.35,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                   "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
//             ),
//           ),
//         ),
//         Text(
//           _weather?.weatherDescription ?? "",
//           style: const TextStyle(fontSize: 20),
//         ),
//       ],
//     );
//   }

//   //widget responsible for displaying the current temperature
//   Widget _currenttemperature() {
//     //this basically gives the unit data as a whole number and if toStringAsFixed is removed then it will give the whole data as a point
//     return Text(
//       "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C",
//       style: TextStyle(fontSize: 19),
//     );
//   }

//   Widget _extractinformation() {
//     return Container(
//       height: MediaQuery.sizeOf(context).height * 0.15,
//       width: MediaQuery.sizeOf(context).width * 0.80,
//       decoration: BoxDecoration(
//         color: Colors.redAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)} °C",
//                 style: TextStyle(fontSize: 19, color: Colors.white),
//               ),
//               Text(
//                 "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)} °C",
//                 style: TextStyle(fontSize: 19, color: Colors.white),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)} m/s",
//                 style: TextStyle(fontSize: 19, color: Colors.white),
//               ),
//               Text(
//                 "Humidity: ${_weather?.humidity?.toStringAsFixed(0)} %",
//                 style: TextStyle(fontSize: 19, color: Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/const_api.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName("Bankura").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _locationheader(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          _datetimeInfo(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _weatherIcon(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _currenttemperature(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _extractinformation(),
        ],
      ),
    );
  }

  Widget _locationheader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _datetimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              " ${DateFormat("d.M.y").format(now)}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _currenttemperature() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C",
      style: TextStyle(fontSize: 19),
    );
  }

  Widget _extractinformation() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Colors.blue, // Choose an appropriate color
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)} °C",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)} °C",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)} m/s",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)} %",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
