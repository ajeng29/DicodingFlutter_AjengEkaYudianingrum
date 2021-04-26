import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:praktikum7/models/movie.dart';

class HttpService{
  final String apiKey = '4eb9ef6cb85384bcaeb10439447eee5c';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List> getPopularMovies()async{
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok){
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];

      List movies = moviesMap.map((i)=>Movie.fromJson(i)).toList();
      return movies;
    }else{
      print("Fail");
      return null;
    }
  }
}