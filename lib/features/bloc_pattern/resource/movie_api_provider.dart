import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'f8b6cf2988363e4455e4f99fe86d6a23';

  Future<ItemModel> fetchMovieList() async {
    print("entered....");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    print(response);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print("Request success....");
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      print("Request failed....");
      throw Exception('Failed to load post');
    }
  }
}
