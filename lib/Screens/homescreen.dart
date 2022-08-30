import 'package:flutter/material.dart';
import 'package:netflix/Screens/top_rated.dart';
import 'package:netflix/Screens/trending_list.dart';
import 'package:netflix/Screens/tvshow_screen.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  static List trendingMovies = [];
  static const String apiKey = '6b90848ea929bdd3ea1c08df1ad1f331';
  static const readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YjkwODQ4ZWE5MjliZGQzZWExYzA4ZGYxYWQxZjMzMSIsInN1YiI6IjYyYWQ4ODYxMGQ5ZjVhMDA5NDIxYTdlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ggODArE8MFRBCcvWxQYXCKsQYo98yeN6aA4L4HezaZc';
  static List topratedmovies = [];
  static List tv = [];
  static List comingsoon = [];

  static loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map comingSoonresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    trendingMovies = trendingResult['results'];
    topratedmovies = topRatedresult['results'];
    tv = tvResult['results'];
    comingsoon = comingSoonresult['results'];
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Row(
                children: [
                  const Text(
                    'TVShows',
                    style: TextStyle(fontSize: 10,color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.19,
                      right: MediaQuery.of(context).size.width * 0.19,
                    ),
                    child: const Text(
                      'Movies',
                      style: TextStyle(fontSize: 10,color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.09),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(top: 5),
              centerTitle: true,
              background: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500' +
                          HomeScreen.topratedmovies[0]['poster_path'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.06,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://flyclipart.com/thumb2/logo-netflix-82838.png',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.7),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: ExactAssetImage(
                                            ''),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Offbeat -',
                          style: TextStyle(
                              color: Color.fromARGB(255, 235, 226, 226)),
                        ),
                        Text(
                          'Psychology',
                          style: TextStyle(
                              color: Color.fromARGB(255, 235, 226, 226)),
                        ),
                        Text(
                          'Cyberpunk',
                          style: TextStyle(
                              color: Color.fromARGB(255, 235, 226, 226)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                Text(
                                  'info',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //**************** T R E N D I N G *************/
          SliverToBoxAdapter(
            child: Container(
              height: 45,
              color: Colors.black,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Trending Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: TrendingList(),
          ),

          //*********************T R E N D I N G  E N D **************/
          //...........................................................//

          //**********************T O P  R A T E D *********************/
          SliverToBoxAdapter(
            child: Container(
              height: 35,
              color: Colors.black,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Top Rated',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: TopRatedScreen(),
          ),
          //********************* E N D I N G  T O P  R A T E D ***************/
          //....................................................................//

          //*********************** T V  S H O W S ******************************/
          SliverToBoxAdapter(
            child: Container(
              height: 35,
              color: Colors.black,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'TV Shows',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: TvShowScreen(),
          ),
        ],
      ),
    );
  }
}
