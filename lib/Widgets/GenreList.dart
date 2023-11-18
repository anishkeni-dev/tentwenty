import 'package:flutter/material.dart';

import '../Service/repository.dart';

class GenreList extends StatefulWidget {
  const GenreList({super.key});

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  List genreBackgrounds = [
    "https://www.themoviedb.org/t/p/original/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg",
    "https://www.themoviedb.org/t/p/original/vpbaStTMt8qqXaEgnOR2EE4DNJk.jpg",
    "https://www.themoviedb.org/t/p/original/hQQCdZrsHtZyR6NbKH2YyCqd2fR.jpg",
    "https://www.themoviedb.org/t/p/original/qaStvnv2VdNxITnHoN85fCM67el.jpg",
    "https://www.themoviedb.org/t/p/original/uZZaTosqLKuMD0cK080BH87SSSX.jpg",
    "https://www.themoviedb.org/t/p/original/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
    "https://www.themoviedb.org/t/p/original/4biEo7gMRiDP50efRtc8Hft6zys.jpg",
    "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
    "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI"
    "https://www.themoviedb.org/t/p/original/bQLrHIRNEkE3PdIWQrZHynQZazu.jpg",
    "https://www.themoviedb.org/t/p/original/9JigWANKzkVdgB0pDBNK03MWMq9.jpg",
    "https://www.themoviedb.org/t/p/original/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg",
    "https://www.themoviedb.org/t/p/original/aQwJHHdrBfcCtBXmNHakBvXpt55.jpg",
    "https://www.themoviedb.org/t/p/original/XF5jV0UxKnYNPAimem0hbwPfCR.jpg",
    "https://www.themoviedb.org/t/p/original/wFjboE0aFZNbVOF05fzrka9Fqyx.jpg",
    "https://www.themoviedb.org/t/p/original/yBLyqfgvnX7MvelaLdUX6jVRy6u.jpg",
    "https://www.themoviedb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "https://www.themoviedb.org/t/p/original/pfte7wdMobMF4CVHuOxyu6oqeeA.jpg",
    "https://www.themoviedb.org/t/p/original/jIywvdPjia2t3eKYbjVTcwBQlG8.jpg",
    "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI"
  ];
  Future<dynamic> futureGenreList = Future.value();

  Repository repo = Repository();

  getGenreList() async {
    var data = await repo.getGenres();
    setState(() {
      futureGenreList = Future.value(data);
    });
  }

  @override
  void initState() {
    getGenreList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
      height: MediaQuery.of(context).size.aspectRatio < 1.0
          ? MediaQuery.of(context).size.height * 0.84
          : MediaQuery.of(context).size.height * 0.63,
      width: MediaQuery.of(context).size.width * 1,
      child: FutureBuilder(
          future: futureGenreList,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? GridView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              colorFilter:
                              ColorFilter.mode(Colors.black.withOpacity(0.6),
                                  BlendMode.darken),
                          image: NetworkImage(index!=8?genreBackgrounds[index]:"https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI"),
                          fit: BoxFit.cover,

                        )),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              snapshot.data[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis),
                            ))),
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.03,
                      childAspectRatio:
                          MediaQuery.of(context).size.width * 0.0038,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.03,
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
