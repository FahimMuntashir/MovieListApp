import 'package:flutter/material.dart';
import 'package:listitem/movie.dart';


class MovieDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      backgroundColor: Colors.grey,
      body: ListView(
        children: <Widget>[
          MovieDetailsThums(thumbnail: movie.images[0]),
          Line(),
          MoviePoster(poster: movie.images[1]),
          SizedBox(height: 30.0,),
          MovieActor(actors: movie.actors,),
          MovieExtraPosters(poster: movie.images,)

        ],
      ),
    );
  }
}



class MovieDetailsThums extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThums({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 190.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  )),
            ),
            Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 100.0,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),


          ),
          height: 60.0,
        )
      ],
    );
  }
}


class MovieDetailsPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            height: 50.0,
          ),
          MovieActor(actors: movie.actors,),

        ],
      ),
    );
  }
}

class MovieActor extends StatelessWidget {
  final String actors;

  const MovieActor({Key key, this.actors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(actors,style: TextStyle(
          color: Colors.redAccent,
//        fontSize: 20.0,
        ),),
      ),
    );
  }
}






class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius= BorderRadius.all(Radius.circular(10.0));
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(

        width: 100,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(poster),
//            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(
        height: 10.0,
        color: Colors.black,
      ),
    );
  }
}


class MovieExtraPosters extends StatelessWidget {
  final List<String>poster;

  const MovieExtraPosters({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('More movies poster.t'.toUpperCase(), style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,

          ),),
          Container(
            height: 200,
            child: ListView.separated(
                itemBuilder: (context,index)=>ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(poster[index]),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index)=>SizedBox(width: 10,),
                itemCount: poster.length),

          ),
        ],
      ),
    );
  }
}
