// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/Pages/MovieDetail.dart';

import '../../Theme/theme.dart';

class MovieCard extends StatelessWidget {
  final data;
  final index;
  const MovieCard({super.key, @required this.data, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: GestureDetector(
          onTap: () {
            Get.to(MovieDetail(movieId: data[index].id,),transition: Transition.rightToLeft);
          },
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/original' +
                      data[index].posterPath,),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:  const LinearGradient(
                   colors: [
                    Colors.transparent,
                    Colors.black, // Adjust opacity as needed
                  ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1],
                  ),
                ),
                child: SizedBox()
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                alignment: Alignment.bottomLeft,
                width: MediaQuery.of(context).size.width * 0.92,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  data[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w800,
                    color: AppTheme().primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
