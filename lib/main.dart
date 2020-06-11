import 'package:flutter/material.dart';

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
        itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
        return Card(
          elevation: 5.0,

          color: Colors.white,
          child: ListTile(
            title: Text(movies[index]),
            subtitle: Text('sub'),
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
              debugPrint('Movies Name : ${movies.elementAt(index)}');
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MovieDetails();
              }));
            },
          ),
        );
      }),
    );
  }
}


class MovieDetails extends StatelessWidget {
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
            child: Text('Go Back'),
              onPressed: (){
              Navigator.pop(context);


          }),
        ),
      ),
    );
  }
}
