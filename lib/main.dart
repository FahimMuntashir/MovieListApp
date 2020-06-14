import 'package:flutter/material.dart';
import 'movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieListView(),
    );
  }
}


class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

 final List movies = [
    'The GodFather',
   'Citizen Cane',
   'The dark knight',
   'Pulp Fiction',
   'Dear john',
   'Gone girl',
   'Shutter Island',
   'The Gift',
   'Interseller',
   'The Notebook',
   'The vinci Code'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.blueGrey.shade600,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
        return Card(
          elevation: 5.0,

          color: Colors.white,
          child: ListTile(
            title: Text(movieList[index].title),
            subtitle: Text("${movieList.elementAt(0).title}"),
            leading: CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Text('F'),
              ),
            ),
            trailing: Text('...'),
            onTap: (){
              debugPrint('Movies Name : ${movieList.elementAt(index).title}');
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MovieDetails(movieName: movieList.elementAt(index).title,);
              }));
            },
          ),
        );
      }),
    );
  }
}


class MovieDetails extends StatelessWidget {

  final String movieName;

  const MovieDetails({Key key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Routes'
        ),

      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Go Back ${this.movieName}'),
              onPressed: (){
              Navigator.pop(context);


          }),
        ),
      ),
    );
  }
}
