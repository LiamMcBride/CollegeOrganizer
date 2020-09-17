import 'package:flutter/material.dart';
import 'package:college_task/CustomItems.dart';
import 'package:college_task/event.dart';

void main() {

  Data.cDay = Formats().systemDate();
  Data.events.add(Event(name: 'Ch 4', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Design')));
  Data.events.add(Event(name: 'Ch 4 Discussion', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Design')));
  Data.events.add(Event(name: 'Ch 4 Quiz', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Design')));
  Data.events.add(Event(name: 'Ch 5', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Design')));
  Data.events.add(Event(name: 'Hokie Engineer', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Engineering')));
  Data.events.add(Event(name: 'OWP 5', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Writing')));
  Data.events.add(Event(name: 'OWP 6', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Writing')));
  Data.events.add(Event(name: 'Process Journal', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Writing')));
  Data.events.add(Event(name: 'Narrative', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Writing')));
  Data.events.add(Event(name: 'Connect Assignment 4', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Chemistry')));
  Data.events.add(Event(name: 'Connect Assignment 5', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Chemistry')));
  Data.events.add(Event(name: 'Lectures', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Chemistry')));
  Data.events.add(Event(name: 'SmartBook 3', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Chemistry')));
  Data.events.add(Event(name: 'Quiz 6', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Calculus')));
  Data.events.add(Event(name: 'Quiz 5', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Calculus')));
  Data.events.add(Event(name: 'Quiz 4', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Calculus')));
  Data.events.add(Event(name: 'Precise def of a limit', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Calculus')));
  Data.events.add(Event(name: 'LF4 Pre-lab report', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Lab')));
  Data.events.add(Event(name: 'LF4 post-lab report', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Lab')));
  Data.events.add(Event(name: 'LF5 Pre-lab report', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Lab')));
  Data.events.add(Event(name: 'LF5 Pre-lab report', date: Date(input: "09/31/2020"), workDate: Date(input: "09/11/2020"), type: Data().searchType('Lab')));


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      //MyHomePage(),
    );
  }
}

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks'),),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            height: 550,
            width: 460,
            //color: Colors.red,
            child: ListView.builder(
              itemCount: Data.events.length,
              itemBuilder: (BuildContext context, int i)
              {

                return cusTaskBox(event: Data.events[i],);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => AddPage()));
        },
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  //String view = 'month';
  int month = 8;
  int year = 2020;

  String monthFormatted() {
    String temp = '';

    if (month < 10) {
      temp = '0' + month.toString();
    } else {
      temp = month.toString();
    }

    return temp;
  }

  Widget viewType() {
    if (Data.viewState == 'month') {
      return cusMonth(
        month: monthFormatted(),
        year: year.toString(),
      );
    } else if (Data.viewState == 'day') {
      return cusDayView(date: Data.selectedDate);
    }

    return cusWeek(
      month: monthFormatted(),
      year: year.toString(),
    );
  }

  String buttonText(String text) {
    String temp = '';

    if (text == 'month') {
      temp = 'week';
    } else if (text == 'week' || text == 'day') {
      temp = 'month';
    }
    return temp;
  }

  //MyHomePage({this.view});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int numDays()
  {
    return Data.monthDays[widget.month];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.monthFormatted())),
      ),
      body: Column(
        children: <Widget>[
          widget.viewType(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //cusViewButton(view: view,),
              Container(
                width: 75,
                height: 30,
                color: Colors.lightBlueAccent,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Data.viewState = widget.buttonText(Data.viewState);
                    });
                  },
                  child: Center(
                    child: Text(widget.buttonText(Data.viewState)),
                  ),
                ),
              ),
              Container(
                width: 75,
                height: 30,
                color: Colors.lightBlueAccent,
                child: FlatButton(
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => AddPage()));
                  },
                ),
              ),
              Container(
                width: 75,
                height: 30,
                color: Colors.lightBlueAccent,
                child: FlatButton(
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  ),
                  onPressed: () {
                    setState(() {
                      if (Data.viewState == 'month') {
                        if (widget.month == 1) {
                          widget.month = 12;
                          widget.year -= 1;
                        } else {
                          widget.month -= 1;
                        }
                      } else if (Data.viewState == 'day') {
                        if (int.parse(Data.selectedDate.day()) == 1) {
                          Data.selectedDate = Formats().date(
                              Data.selectedDate.month(),
                              numDays(),
                              Data.selectedDate.year());
                          if (widget.month == 1) {
                            widget.month = 12;
                            widget.year -= 1;
                          } else {
                            widget.month -= 1;
                          }
                        } else {
                          Data.selectedDate = Formats().date(
                              Data.selectedDate.month(),
                              int.parse(Data.selectedDate.day()) - 1,
                              Data.selectedDate.year());
                        }
                      }
                    });
                  },
                ),
              ),
              Container(
                width: 75,
                height: 30,
                color: Colors.lightBlueAccent,
                child: FlatButton(
                  child: Center(
                    child: Icon(Icons.arrow_forward),
                  ),
                  onPressed: () {
                    setState(() {
                      if (Data.viewState == 'month') {
                        if (widget.month == 12) {
                          widget.month = 1;
                          widget.year += 1;
                        } else {
                          widget.month += 1;
                        }
                      }
                      else if (Data.viewState == 'day') {
                        if (int.parse(Data.selectedDate.day()) == numDays()) {
                          Data.selectedDate = Formats().date(
                              Data.selectedDate.month(),
                              1,
                              Data.selectedDate.year());
                          if (widget.month == 12) {
                            widget.month = 1;
                            widget.year += 1;
                          } else {
                            widget.month += 1;
                          }
                        } else {
                          Data.selectedDate = Formats().date(
                              Data.selectedDate.month(),
                              int.parse(Data.selectedDate.day()) + 1,
                              Data.selectedDate.year());
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddPage extends StatelessWidget {

  TextEditingController contTitle = TextEditingController();
  TextEditingController contDate1 = TextEditingController(text: Data.cDay.month());
  TextEditingController contDate2 = TextEditingController();
  TextEditingController contDate3 = TextEditingController(text: Data.cDay.year());
  TextEditingController contType = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('New')),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            cusText(txt: 'Title',size: 30,),
            SizedBox(height: 10,),
            cusField(hintText: 'Title Goes Here', cont: contTitle,w: 500,),
            SizedBox(height: 20,),
           /* cusText(txt: 'Time',size: 30,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                cusText(txt: 'Start', size: 20,),
                cusText(txt: 'End', size: 20,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                cusText(txt: 'Hour',size: 15,),
                Container(
                  width: 41,
                  height: 50,
                  child: cusDropDown(lim: 24, order: 0,),
                ),
                cusText(txt: 'Min',size: 15),
                Container(
                  width: 41,
                  height: 50,
                  child: cusDropDown(lim: 60, order: 1,),
                ),
                cusText(txt: 'Hour',size: 15,),
                Container(
                  width: 41,
                  height: 50,
                  child: cusDropDown(lim: 24, order: 2,),
                ),
                cusText(txt: 'Min',size: 15,),
                Container(
                  width: 41,
                  height: 50,
                  child: cusDropDown(lim: 60, order: 3,),
                ),
                //cusField(hintText: 'Start', cont: contSTime,w: 100,),
                //cusField(hintText: 'End', cont: contETime,w: 100,),
              ],
            ),*/
            cusText(txt: 'Type',size: 30,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                cusDropDown(typeList: Data.types),
                Container(
                  color: Colors.blue,
                  width: 100,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => ColorPage()));
                    },
                    child: Text('New Type'),
                  ),
                ),

              ],
            ),
            //cusField(hintText: 'Type Goes Here', cont: contType,w: 500,),
            SizedBox(height: 20,),
            cusText(txt: 'Date',size: 30,),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                cusField(hintText: 'Month', cont: contDate1,w: 100,),
                cusField(hintText: 'Day', cont: contDate2,w: 100,),
                cusField(hintText: 'Year', cont: contDate3,w: 100,),
              ],
            ),//Day
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: 100,
                  child: FlatButton(
                    onPressed: (){

                     // var startTime = Formats().dayFormatted(Data.timeValues[0]) + ':' + Formats().dayFormatted(Data.timeValues[1]);
                      //var endTime = Formats().dayFormatted(Data.timeValues[2]) + ':' + Formats().dayFormatted(Data.timeValues[3]);
                     // Data.timeValues = [0,0,0,0];
                      Event newEvent = Event(name: contTitle.text, date: Formats().date(contDate1.text, int.parse(contDate2.text), contDate3.text),
                          workDate: Formats().date(contDate1.text, int.parse(contDate2.text), contDate3.text), type: Data.types[Data.label]);

                      Data.events.add(newEvent);
                      contTitle.text = '';
                      contDate1.text = '';
                      contDate2.text = '';
                      contDate3.text = '';






                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
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
                              builder: (context) => HomePage()));
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
