import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';

class RecommendPage extends StatefulWidget {
  @override
  State createState() => new RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> {
  // Map<String, bool> basedOn = {
  //   'Animae Name': true,
  //   'Genre': false,
  // };

  List<String> basedOn = [
    'ANIME NAME',
    'GENRE',
  ];

  static List<String> checkedItemList = [
    'ANIME NAME',
  ];

  List<String> selectedItemList = checkedItemList ?? [];

  List testAnimeNames = [
    'Naruto',
    'Dragon Ball Z',
    'One Piece',
    'Death Note',
    'Parasyte',
    'Assasination Classroom',
  ];

  List testGenreAnime = [
    'Action, Adventure, Drama, Life lessons, Emotional',
    'Action, Adventure, Drama, Emotional',
    'Action, Adventure, Drama, Emotional',
    'Investigation, Twist, Drama',
    'Action, Twist, Emotional',
    'Life lessons, Emotional'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Second Route"),
      // ),

      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       // Navigate back to first route when tapped.
      //     },
      //     child: Text('Go back!'),
      //   ),
      // ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.shortestSide * 0.1),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/anime3.jpg"),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.shortestSide * 0.06),
              child: Container(
                child: Text(
                  'Anime recommender',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Based on',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                letterSpacing: .4,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                    ),
                    GroupedCheckbox(
                      textStyle: GoogleFonts.lato(
                        color: Colors.black,
                        letterSpacing: .4,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      wrapSpacing: 10.0,
                      wrapRunSpacing: 15.0,
                      wrapTextDirection: TextDirection.ltr,
                      wrapRunAlignment: WrapAlignment.center,
                      wrapVerticalDirection: VerticalDirection.down,
                      wrapAlignment: WrapAlignment.center,
                      itemList: basedOn,
                      checkedItemList: checkedItemList,
                      // disabled: ['Black'],
                      onChanged: (itemList) {
                        setState(() {
                          selectedItemList = itemList;
                          print('SELECTED ITEM LIST $itemList');
                        });
                      },
                      orientation: CheckboxOrientation.VERTICAL,
                      checkColor: Colors.black,
                      activeColor: Colors.greenAccent,
                    ),

                    // GroupedCheckbox(
                    //     // itemList: allItemList,
                    //     itemList: basedOn,
                    //     checkedItemList: checkedItemList,
                    //     disabled: ['Black'],
                    //     onChanged: (itemList) {
                    //       setState(() {
                    //         selectedItemList = itemList;
                    //         print('SELECTED ITEM LIST $itemList');
                    //       });
                    //     },
                    //     orientation: CheckboxOrientation.VERTICAL,
                    //     checkColor: Colors.blue,
                    //     activeColor: Colors.red),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, top: 20.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .4,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red, width: 5.0),
                  // ),
                  hintText: 'Enter Anime Name',
                  hintStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                )),
          ),
          FlatButton(
              color: Colors.greenAccent,
              onPressed: () {},
              child: Text(
                'Recommend',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .4,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Recommendations...',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .4,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            /*Add a pop up box to show info in detail about each recommendations.......... */
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: testAnimeNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    AnimatedCard(
                      curve: Curves.ease,
                      direction: AnimatedCardDirection.bottom,
                      initDelay: Duration(milliseconds: 0),
                      duration: Duration(seconds: 1),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top:
                                MediaQuery.of(context).size.shortestSide * 0.01,
                            left: MediaQuery.of(context).size.shortestSide *
                                0.002,
                            right: MediaQuery.of(context).size.shortestSide *
                                0.002),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,

                              colors: [Colors.lightBlue[50], Colors.white],

                              // colors: [
                              //   Colors.redAccent,
                              //   Colors.redAccent[100]
                              // ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                0.025,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                0.01),
                                        child: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                              "assets/images/anime3.jpg"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.01),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //csd
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.35,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .shortestSide *
                                                          0.015),
                                                  child: Text(
                                                    // "DTLabz",
                                                    // notificationController
                                                    //     .notify_by[index],
                                                    testAnimeNames[index],
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Color(0xFF2A2727),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: .5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.01,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.01),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.35,
                                            child: Text(
                                              // "Semester "
                                              // "${leaderBoardController.leaders[index].semester}",
                                              // "You have a simple update on the app. So in order to get extra features update the app",

                                              // notificationController
                                              //     .notify_desc[index],
                                              testGenreAnime[index],
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Color(0xFF2A2727),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: .5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .shortestSide *
                                                    0.01,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .shortestSide *
                                                    0.01,
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.0,
                                                    child: Text(
                                                      testAnimeNames[index],
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: .5),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.0,
                                            ),
                                            //ssss
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
