import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tentwenty/Pages/MovieDetail.dart';
import '../Bloc/AppBar/AppBarBloc.dart';
import '../Bloc/AppBar/AppBarStates.dart';
import '../Theme/theme.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarStates>(
      builder: (context, state) {
        if (state is SearchResultsLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("Top results")),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.aspectRatio < 1.0
                    ? MediaQuery.of(context).size.height * 0.775
                    : MediaQuery.of(context).size.height * 0.48,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(MovieDetail(movieId: state.searchData[index].id));
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(20), // Image border
                              child: Image.network(
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://image.tmdb.org/t/p/original' +
                                    state.searchData[index].posterPath,
                                width: 140,
                                height: 100,
                                fit: BoxFit.cover,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.48,
                                      child: Text(
                                        state.searchData[index].title,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      child: Text(
                                        "PlaceHolder",
                                        style: TextStyle(
                                            color: AppTheme().tertiaryTextColor,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  itemCount: state.searchData.length,
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
