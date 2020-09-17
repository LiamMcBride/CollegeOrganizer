import 'package:flutter/material.dart';
import 'package:college_task/event.dart';
import 'package:college_task/main.dart';
import 'dart:math';


class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  TextEditingController contTitle = TextEditingController();
  var rgbo = [0.0,0.0,0.0];
  Color wheelColor()
  {
    return Color.fromRGBO(rgbo[0].round(), rgbo[1].round(), rgbo[2].round(), 1);
  }
  void _setvalue1(double value) => setState(() => rgbo[0] = value.roundToDouble());
  void _setvalue2(double value) => setState(() => rgbo[1] = value.roundToDouble());
  void _setvalue3(double value) => setState(() => rgbo[2] = value.roundToDouble());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Type'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            cusText(txt: 'Title',size: 30,),
            SizedBox(height: 10,),
            cusField(hintText: 'Title Goes Here', cont: contTitle,w: 300,),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: 250,
                height: 250,
                color: wheelColor(),
              ),
            ),
            SizedBox(height: 10,),
            Slider(value: rgbo[0], onChanged: _setvalue1,min: 0, max: 250, divisions: 250),
            Slider(value: rgbo[1], onChanged: _setvalue2,min: 0, max: 250, divisions: 250),
            Slider(value: rgbo[2], onChanged: _setvalue3,min: 0, max: 250, divisions: 250),
            //Slider(value: rgbo[3], onChanged: _setvalue4,min: 0, max: 250, divisions: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: 100,
                  child: FlatButton(
                    onPressed: (){

                      Data.types.add(Type(name: contTitle.text, color: wheelColor()));

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => AddPage()));
                    },
                    child: Text('Submit'),
                  ),
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  child: FlatButton(
                    onPressed: (){

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => AddPage()));
                    },
                    child: Text('Cancel'),
                  ),
                )
              ],
            )






          ],
        ),
      ),
    );
  }
}




class cusDropDown extends StatefulWidget {
  final List<Type> typeList;

  cusDropDown({this.typeList});

  @override
  _cusDropDownState createState() => _cusDropDownState();
}

class _cusDropDownState extends State<cusDropDown> {

  int cValue = 0;
  List<DropdownMenuItem> DropDownHours()
  {

    var temp = new List<DropdownMenuItem>();

    for(int i = 0; i < widget.typeList.length; i++)
    {
      temp.add(DropdownMenuItem(
        value: i,

        child: Container(

            color: widget.typeList[i].color,
            child: Text(widget.typeList[i].name)
        ),

      ));
    }

    return temp;

  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(

      value: cValue,
      items: DropDownHours(),
      onChanged: (value){

        setState(() {
          Data.label = value;
          cValue = value;

        }

        );

      },
    );
  }
}











class cusTaskBox extends StatefulWidget {
  final Event event;

  cusTaskBox({this.event});

  @override
  _cusTaskBoxState createState() => _cusTaskBoxState();
}

class _cusTaskBoxState extends State<cusTaskBox> {

  double opa = 0;

  Color percentColor() {
    if (widget.event.progress == 100) {
      return Colors.green;
    }
    return Colors.red;
  }

  String dueDateFormat() {
    String temp = '';
    if (widget.event.date.day()[1] == '1') {
      temp = widget.event.date.day() + 'st';
    } else if (widget.event.date.day()[1] == '2') {
      temp = widget.event.date.day() + 'nd';
    } else if (widget.event.date.day()[1] == '3') {
      temp = widget.event.date.day() + 'rd';
    } else {
      temp = widget.event.date.day() + 'th';
    }
    return temp;
  }

  double toPercent(double input)
  {
    double temp = 0;
    temp = input;


    temp = temp.roundToDouble();


    return temp;
  }

  void _done(double value)
  {
    opa = 0;
  }

  //double _value = widget.event.progress
  void _setvalue(double value) => setState(() => widget.event.progress = toPercent(value));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          height: 50,
          width: 460,
          color: Colors.grey[600],
          child: Row(
            children: <Widget>[
              Container(
                width: 175,
                height: 40,
                //color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.event.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 30,
                height: 40,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Due:',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      dueDateFormat(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                width: 60,
                height: 40,
                color: widget.event.type.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.event.type.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                color: percentColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    widget.event.progress.round().toString() + "%",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 0,
          child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: 50,
              width: 460,
              color: Colors.grey[600],
            child: Row(
              children: <Widget>[
                Slider(value: widget.event.progress, onChanged: _setvalue,min: 0, max: 100, divisions: 20, onChangeEnd: _done,),

              ],
            ),

          ),
        ),
      ],
    );
  }
}





//***********************************************************************
//Monday, tuesday, etc cards
class cusWeekDay extends StatelessWidget {
  final String day;

  cusWeekDay({this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 25,
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.all(5),
      child: Center(child: Text(day)),
    );
  }
}

//Day card
class cusDay extends StatelessWidget {
  final String style;
  final Date date;

  var dayEvents = new List<Event>();

  cusDay({this.style, this.date});

  //Highlights if it's the current day
  Color headColor() {
    if (Data.cDay.year() == date.year() &&
        Data.cDay.month() == date.month() &&
        Data.cDay.day() == date.day()) {
      return Colors.blue;
    }
    return Colors.lightBlueAccent;
  }

  //Returns the variable width based off day type
  double vWidth() {
    double temp;
    if (style == 'month') {
      temp = 48;
    } else if (style == 'week') {
      temp = 48;
    } else if (style == 'day') {
      temp = 349;
    }

    return temp;
  }

  //Returns the variable height based off day type
  double vHeight() {
    double temp;
    if (style == 'month') {
      temp = 110;
    } else if (style == 'week') {
      temp = 557;
    } else if (style == 'day') {
      temp = 590;
    }

    return temp;
  }

  //Returns # of events in the day
  int numEvents() {
    int temp = 0;

    dayEvents = Data().eventsInDay(date);

    temp = dayEvents.length;

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      width: vWidth(),
      height: vHeight(),
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: vWidth(),
            height: (vHeight() / 8),
            color: headColor(),
            child: FlatButton(
                onPressed: () {
                  if (style != 'day') {
                    Data.viewState = 'day';
                    Data.selectedDate = date;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
                child: Center(child: Text(date.day()))),
          ),
          //Holds the days events column
          Container(
            padding: EdgeInsets.all(vWidth() / 30),
            width: vWidth(),
            height: (vHeight() - (vHeight() / 8)),
            //color: Colors.white,
            child: ListView.builder(
              itemCount: numEvents(),
              itemBuilder: (BuildContext context, int i) {
                return cusEvent(
                  vWidth: vWidth(),
                  vHeight: vHeight(),
                  event: dayEvents[i],
                );
              },
            ),
            /*Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[



                  //Max rn is 7 displaying
                  /*for(int i = 0; i < 7; i++)
                  cusEvent(vWidth: (vWidth() - 2 * (vWidth() / 30)), vHeight: vHeight(),),*/
                ],
              ),*/
          ),
        ],
      ),
    );
  }
}

class cusEvent extends StatelessWidget {
  final double vWidth;
  final double vHeight;
  final Event event;

  cusEvent({this.vWidth, this.vHeight, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(vWidth / 30),
      width: (vWidth - 2 * (vWidth / 30)),
      height: vHeight / 10,
      color: Colors.red,
      child: Text(
        event.name,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}

class cusMonth extends StatelessWidget {
  final String month;
  final String year;
  cusMonth({this.month, this.year});

  int numDays() {
    return Data.monthDays[int.parse(month)] + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 4, 0),
      child: Column(
        children: <Widget>[
          //Days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cusWeekDay(
                day: 'Mon',
              ),
              cusWeekDay(
                day: 'Tues',
              ),
              cusWeekDay(
                day: 'Wed',
              ),
              cusWeekDay(
                day: 'Thu',
              ),
              cusWeekDay(
                day: 'Fri',
              ),
              cusWeekDay(
                day: 'Sat',
              ),
              cusWeekDay(
                day: 'Sun',
              )
            ],
          ),
          for (int j = 0; j < 5; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for (int i = 1; i < 8; i++)
                  if (((j * 7) + i) < numDays())
                    cusDay(
                      style: 'month',
                      date: Formats().date(month, ((j * 7) + i), year),
                    ),
              ],
            ),
        ],
      ),
    );
  }
}

class cusWeek extends StatelessWidget {
  final String month;
  final String year;
  cusWeek({this.month, this.year});

  int numDays() {
    return Data.monthDays[int.parse(month)] + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 4, 0),
      child: Column(
        children: <Widget>[
          //Days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cusWeekDay(
                day: 'Mon',
              ),
              cusWeekDay(
                day: 'Tues',
              ),
              cusWeekDay(
                day: 'Wed',
              ),
              cusWeekDay(
                day: 'Thu',
              ),
              cusWeekDay(
                day: 'Fri',
              ),
              cusWeekDay(
                day: 'Sat',
              ),
              cusWeekDay(
                day: 'Sun',
              )
            ],
          ),
          for (int j = 0; j < 1; j++)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for (int i = 1; i < 8; i++)
                  if (((j * 7) + i) < numDays())
                    cusDay(
                      style: 'week',
                      date: Formats().date(month, ((j * 7) + i), year),
                    ),
              ],
            ),
        ],
      ),
    );
  }
}

class cusDayView extends StatelessWidget {
  final Date date;

  cusDayView({this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 4, 0),
      child: Column(
        children: <Widget>[
          //Days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              cusDay(
                style: 'day',
                date: date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//View Button
class cusViewButton extends StatelessWidget {
  final String view;

  cusViewButton({this.view});

  String buttonText() {
    String temp = '';

    if (view == 'month') {
      temp = 'week';
    } else if (view == 'week' || view == 'day') {
      temp = 'month';
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 75,
      height: 35,
      color: Colors.lightBlueAccent,
      child: FlatButton(
        onPressed: () {},
        child: Center(child: Text(buttonText())),
      ),
    );
  }
}

//Text
class cusText extends StatelessWidget {
  final String txt;
  final double size;

  cusText({this.txt, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.blue,
        fontSize: size,
      ),
    );
  }
}

//Text field
class cusField extends StatelessWidget {
  final String hintText;
  final TextEditingController cont;
  final double w;

  cusField({this.hintText, this.cont, this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
            hintStyle: TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}

