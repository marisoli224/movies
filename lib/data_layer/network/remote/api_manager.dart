import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/const.dart';

import '../../models/Movies.dart';

class ApiManager {

  static Future<Movies> search(String query) async {
    Uri url = Uri.https(Consts.base_url, '/3/search/movie',
        {'api_key': Consts.API_KEY, 'query': query});
    final response = await http.get(url);
    var search = Movies.fromJson(jsonDecode(response.body));
    return search;
  }











}