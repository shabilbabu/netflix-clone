import 'package:flutter/material.dart';
import 'package:netflix/Screens/details.dart';
import 'package:netflix/Screens/homescreen.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * 0.3,
        child: SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeScreen.topratedmovies.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Details(
                                    name: HomeScreen.topratedmovies[index]
                                        ['title'],
                                    description: HomeScreen
                                        .topratedmovies[index]['overview'],
                                    bannerurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            HomeScreen.topratedmovies[index]
                                                ['backdrop_path'],
                                    posterurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            HomeScreen.topratedmovies[index]
                                                ['poster_path'],
                                    vote: HomeScreen.topratedmovies[index]
                                            ['vote_average'] ??
                                        'Loading',
                                    relese: HomeScreen.topratedmovies[index]
                                            ["release_date"] ??
                                        'Loading',
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          HomeScreen.topratedmovies[index]
                                              ['poster_path'],
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
