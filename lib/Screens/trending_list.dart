import 'package:flutter/material.dart';
import 'package:netflix/Screens/details.dart';
import 'package:netflix/Screens/homescreen.dart';

class TrendingList extends StatefulWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.black,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: HomeScreen.trendingMovies.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Details(
                                name: HomeScreen.trendingMovies[index]
                                        ['title'] ??
                                    '',
                                description: HomeScreen.trendingMovies[index]
                                        ['overview'] ??
                                    'Loading..',
                                bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                    HomeScreen.trendingMovies[index]['backdrop_path'],
                                posterurl: 'http://image.tmdb.org/t/p/w500' +
                                    HomeScreen.trendingMovies[index]
                                        ['poster_path'],
                                relese: HomeScreen.trendingMovies[index]
                                        ['release_date'] ??
                                    'coming soon',
                                vote: HomeScreen.trendingMovies[index]
                                        ['vote_average'] ??
                                    'Loading..',
                                //  vote: Home.trendingmovies[index]['vote_average']??'Loading',
                                //  launch_on:  Home.trendingmovies[index]['release_date']?? 'Loading..'.toString()
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      HomeScreen.trendingMovies[index]
                                          ['poster_path'],
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,
                  //   child: Text( Home.trendingmovies[index]['title'] ?? 'Loading..',style: const TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis)),)
                ],
              ),
            );
          }),
    );
  }
}
