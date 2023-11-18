import 'package:flutter/material.dart';
import 'package:tentwenty/Pages/SeatSelect.dart';
import 'package:tentwenty/Widgets/Common/buttons.dart';
import 'package:get/get.dart';

import '../Theme/theme.dart';

class Showtime extends StatefulWidget {
  final movieName;
  final inTheaters;
  Showtime({super.key, this.movieName, this.inTheaters});

  @override
  State<Showtime> createState() => _ShowtimeState();
}

class _ShowtimeState extends State<Showtime> {
  int selectedCard = 0;
  String selectedDate = "5 Mar";
  List dates = ["5 Mar", "6 Mar", "7 Mar", "8 Mar", "9 Mar"];
  List cardData = [
    {'time': "12:30", "hall": 1, "amount": "50", 'bonus': '2500'},
    {'time': "1:00", "hall": 2, "amount": "70", 'bonus': '2500'},
    {'time': "2:30", "hall": 3, "amount": "80", 'bonus': '2500'},
    {'time': "3:00", "hall": 1, "amount": "70", 'bonus': '2500'},
    {'time': "3:30", "hall": 2, "amount": "70", 'bonus': '2500'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().scaffoldBackground,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            centerTitle: true,
            title: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      widget.movieName,
                      style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.w600 ),
                    ),
                    Text("In theatres ${widget.inTheaters}",
                        style: TextStyle(
                          fontSize: 14,color: AppTheme().secondaryColor
                        ))
                  ],
                )),
          )),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Date",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            transform: Matrix4.translationValues(10, -70, 0),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      selectedDate = dates[index];
                      setState(() {});
                    },
                    child: Chip(
                        color: MaterialStateColor.resolveWith((states) =>
                            dates[index] == selectedDate
                                ? AppTheme().secondaryColor
                                : AppTheme().scaffoldBackground),
                        label: Text(dates[index]))),
              ),
              itemCount: dates.length,
            )),
        Container(
            transform: Matrix4.translationValues(0, -120, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(cardData[index]['time'] + " "),
                            Text("Cinetech + Hall " +
                                cardData[index]['hall'].toString())
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCard = index;
                            });
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: selectedCard == index
                                      ? AppTheme().secondaryColor
                                      : Colors.black12,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                "assets/MapMobile.png",
                                scale: 0.8,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            "From ${cardData[index]['amount']}\$ or${cardData[index]['bonus']}  bonus"),
                      ),
                    ],
                  )),
              itemCount: 4,
            )),
      ]),
      bottomSheet: Container(
          color: AppTheme().scaffoldBackground,
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: PrimaryElevatedButton(
            onPress: () {
              Get.to(SeatSelect(
                inTheaters: "March 5, 2023 | 12:30 Hall 1",
                movieName: widget.movieName,
              ));
            },
            buttonText: "Select Seats",
          )),
    );
  }
}
