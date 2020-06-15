import 'package:flutter/cupertino.dart';
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

// final List movies = [
//    'The GodFather',
//   'Citizen Cane',
//   'The dark knight',
//   'Pulp Fiction',
//   'Dear john',
//   'Gone girl',
//   'Shutter Island',
//   'The Gift',
//   'Interseller',
//   'The Notebook',
//   'The vinci Code'
//  ];
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
          return movieCard(movieList[index], context);
//        return Card(
//          elevation: 5.0,
//
//          color: Colors.white,
//          child: ListTile(
//            title: Text(movieList[index].title),
//            subtitle: Text("${movieList.elementAt(index).title}"),
//            leading: CircleAvatar(
//              child: Container(
//                height: 200,
//                width: 200,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: NetworkImage(movieList[index].images[0]),
//                    fit: BoxFit.cover,
//                  ),
//                  color: Colors.blue,
//                  borderRadius: BorderRadius.circular(10.0)
//                ),
//                child: null,
//              ),
//            ),
//            trailing: Text('...'),
//            onTap: (){
//              debugPrint('Movies Name : ${movieList.elementAt(index).title}');
//              Navigator.push(context, MaterialPageRoute(builder: (context){
//                return MovieDetails(movieName: movieList.elementAt(index).title,
//                movie: movieList[index],);
//              }));
//            },
//          ),
//        );
      }),
    );
  }
  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0,right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(movie.title),
                    Text("Country: ${movie.country}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released: ${movie.released}"),
                    Text("Year: ${movie.year}"),
//                    Text("Genre: ${movie.genre}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: (){
        debugPrint('I got clicked');
      },
    );
  }
}


class MovieDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieDetails({Key key, this.movieName, this.movie}) : super(key: key);

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
            child: Text('Go Back ${this.movie.title}'),
              onPressed: (){
              Navigator.pop(context);


          }),
        ),
      ),
    );
  }
}
