import 'dart:math';

import 'package:flutter/material.dart';
import 'package:worklife_app/homePageBackground.dart';

class WorkLife extends StatefulWidget {
  _WorkLifeState createState() => _WorkLifeState();
}

class _WorkLifeState extends State<WorkLife> {
  //ScreenData

  //double
  double padding = 16.0;
  double radius = 8.0;
  double slideWidth = 100.0;
//profile image
  String _image =
      'https://cdn.pixabay.com/photo/2019/02/20/10/04/penguin-4008872_960_720.jpg';
  String _backgroundImage =
      'https://cdn.pixabay.com/photo/2019/12/07/14/55/labrador-4679457_960_720.png';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Stack(
          children: <Widget>[
            HomePageBackGround(screenSize: screenHeight),
            Column(
              children: <Widget>[
                //Appbar
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 18),
                  margin: EdgeInsets.only(left: padding, right: padding * 2),
                  height: 36,
                  child: Row(
                    children: <Widget>[
                      //left icon
                      Icon(Icons.settings, size: 20, color: Colors.black),
                      Spacer(),
                      //right icon
                      Container(
                        // height: 40,
                        width: 36,
                        child: Stack(
                          children: <Widget>[
                            //circle shape image
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(_image),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            //badges
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepOrange),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Hello ",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: "Shubham!",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                Text(
                  'How is your work-life balance this week?',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                // chart container
                Container(
                  height: 80,
                  margin: EdgeInsets.only(
                      top: padding, left: padding, right: padding),
                  child: Stack(
                    //fit: StackFit.passthrough,
                    children: <Widget>[
                      //orange color container
                      Positioned(
                        top: padding,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.deepOrangeAccent.withOpacity(0.7)),
                          child: Row(
                            children: <Widget>[
                              //chart
                              Container(
                                margin: EdgeInsets.only(right: padding),
                                width: 64,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 32,
                                      left: -6,
                                      right: 0,
                                      bottom: 0,
                                      child: CustomPaint(
                                        painter: ChartPaint(),
                                      ),
                                    ),

                                    //center text
                                    Positioned.fill(
                                      child: Center(
                                        child: Text(
                                          '80%',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //Text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Good job Shubham!',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Text('Your life is well balanced!',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // right image
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.network(_backgroundImage,
                            fit: BoxFit.contain, width: 100),
                      )
                    ],
                  ),
                ),
                //text for tasks
                Container(
                  margin: EdgeInsets.only(
                      top: padding, left: padding, right: padding),
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //text : your tasks
                            Text('Your tasks',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text('You have 4 tasks for today',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),

                      //calendar icon
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //list: bottom container
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.only(top: padding, bottom: padding),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: padding, bottom: padding),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: padding),
                          height: 64,
                          child: Stack(
                            children: <Widget>[
                              //White Container
                              //background color green slide
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  width: taskList[index].isSelected
                                      ? slideWidth + 6
                                      : 0.0,
                                  color: Colors.green[200],
                                  child: Center(
                                    child: Text(
                                      'Done!',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.bounceInOut,
                                top: 0,
                                left: taskList[index].isSelected
                                    ? slideWidth
                                    : padding,
                                bottom: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                            color: Colors.black12)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(radius / 2)),
                                  child: Row(
                                    children: <Widget>[
                                      //check box
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            taskList[index].isSelected =
                                                !taskList[index].isSelected;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.bounceInOut,
                                          height: 24,
                                          margin:
                                              EdgeInsets.only(right: padding),
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: taskList[index].isSelected
                                                  ? Colors.black
                                                  : Colors.white,
                                              border: taskList[index].isSelected
                                                  ? null
                                                  : Border.all(
                                                      color: Colors.grey,
                                                      width: 1.5)),
                                          child: taskList[index].isSelected
                                              ? Center(
                                                  child: Icon(Icons.check,
                                                      size: 20,
                                                      color: Colors.white),
                                                )
                                              : Container(),
                                        ),
                                      ),

                                      //text
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 8),
                                              decoration: ShapeDecoration(
                                                  shape: StadiumBorder(),
                                                  color: Colors.lightBlue
                                                      .withOpacity(0.2)),
                                              child: Text(taskList[index].title,
                                                  style: TextStyle(
                                                      color: Colors.lightBlue,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(taskList[index].subTitle,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      //Image
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: padding * 2),
                                        child: Icon(
                                          Icons.timer,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),

      //bottomNavBar
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        //notchMargin: 8.0,
        elevation: 16,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          height: 64.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home, size: 20, color: Colors.black),
              Icon(Icons.table_chart, size: 20, color: Colors.black),
              SizedBox(width: padding),
              Icon(Icons.calendar_today, size: 20, color: Colors.black),
              Icon(Icons.person_outline, size: 20, color: Colors.black),
            ],
          ),
        ),
      ),

      //flotingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// item list
class TaskList {
  String title;
  String subTitle;
  bool isSelected;

  TaskList({this.title, this.subTitle, this.isSelected});
}

List<TaskList> taskList = [
  TaskList(title: 'Work', subTitle: 'Subtitle work', isSelected: false),
  TaskList(title: 'Family', subTitle: 'Dinner with family', isSelected: false),
  TaskList(title: 'Work', subTitle: 'Rewards', isSelected: false),
  TaskList(title: 'Health', subTitle: 'Workout', isSelected: false),
];

//chart customPaint
class ChartPaint extends CustomPainter {
  double radius = 20;
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(radius: radius, center: Offset(36.0, 0.0));
    double startAngle = 0.0;
    double sweepAngle = pi * 2;
    bool useCenter = false;

    var paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Color.fromRGBO(236, 122, 77, 1);

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    var paint2 = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.white;

    canvas.drawArc(rect, -pi, pi * 2 * 0.80, useCenter, paint2);

    canvas.rotate(2.0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
