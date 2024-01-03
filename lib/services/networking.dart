import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  String url;

  Future getData() async {
    // Convert the url string to a Uri object
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

//double temperature = decodeData['main']['temp'];
//int condition = decodeData['weather'][0]['id'];
//String cityName= decodeData['name'];
//print(temperature);
//print(condition);
//print(cityName);