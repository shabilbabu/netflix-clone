import 'package:flutter/material.dart';
import 'package:netflix/Screens/details.dart';
import 'package:netflix/Screens/homescreen.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * 0.3,
        child: SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeScreen.tv.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Details(
                                  name: HomeScreen.tv[index]['title'] ??
                                      'Loading',
                                  description:
                                      HomeScreen.tv[index]['overview'] ?? '',
                                  bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                      HomeScreen.tv[index]['backdrop_path'],
                                  posterurl: 'http://image.tmdb.org/t/p/w500' +
                                      HomeScreen.tv[index]['poster_path'],
                                  vote: HomeScreen.tv[index]['vote_average'] ??
                                      'Loading..',
                                  relese: HomeScreen.tv[index]
                                          ['first_air_date'] ??
                                      'Loading..')));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          HomeScreen.tv[index]
                                              ['poster_path']))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
