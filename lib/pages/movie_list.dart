import 'package:flutter/material.dart';
import 'package:praktikum7/pages/movie_detail.dart';
import 'package:praktikum7/service/http_service.dart';

class MovieList extends StatefulWidget{
  @override
  _MovieListState createState()=> _MovieListState();
}

class _MovieListState extends State<MovieList>{
  String result ="";
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async{
    movies =[];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = '+movies[position].voteAverage.toString(),
              ),
              onTap: (){
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_)=>MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      )
    );
  }
}