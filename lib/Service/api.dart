import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchData() async {
  const String apiKey = '38c8e4e13865d22d2fb57bc0ce01dcf1';
  const String apiUrl = 'https://api.themoviedb.org/3/discover/movie';

  // Create query parameters
  Map<String, String> queryParams = {
    'api_key': apiKey,
    // Add any additional parameters you want here
  };

  // Build the URL with query parameters
  Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

  // Make the HTTP GET request
  http.Response response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    Map<String, dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    // If the call was not successful, throw an error
    throw Exception('Failed to load data');
  }
}


