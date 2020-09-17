import 'package:flutter/material.dart';

class Event
{
  final String name;
  final Date date;
  final Date workDate;
  final Type type;


  Event({this.name,this.date,this.workDate, this.type});

  double progress = 0;

}

class Type
{
  final String name;
  final Color color;
  Type({this.name, this.color});


}

class Date
{
  final String input;
  Date({this.input});

  String month()
  {
    String temp;
    temp = input.substring(0,2);
    return temp;
  }
  String day()
  {
    String temp;
    temp = input.substring(3,5);
    return temp;
  }
  String year()
  {
    String temp;
    temp = input.substring(6,10);
    return temp;
  }



}

class Data
{
  static String viewState = 'month';
  static Date selectedDate;
  static Date cDay;
  static int label;
  static var events = [
    //Event(name: 'Ch4 Chapter', date: Date(input: '09/09/2020'), workDate: Date(input: '09/20/2020'), type: searchType('Design')),
    //Event(name: 'Run2',date: Date(input: '08/26/2020'),sTime: '11:00',eTime: '12:00'),
  ];
  static var types = [
    Type(name: 'Design', color: Colors.cyan[300]),
    Type(name: 'Engineering', color: Colors.grey[300]),
    Type(name: 'Writing', color: Colors.greenAccent[400]),
    Type(name: 'Chemistry', color: Colors.yellowAccent),
    Type(name: 'Calc', color: Colors.red[200]),
    Type(name: 'Lab', color: Colors.indigo[200]),

  ];
  static var monthDays = {1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31,};

  static var timeValues = [0,0,0,0];

  //Searches for type based off name
  Type searchType(String title)
  {

    for(Type ty in types)
      {
        if(ty.name.toLowerCase() == title.toLowerCase())
          {
            return ty;
          }

      }
    types.add(Type(name: title, color: Colors.purple));
    return Type(name: title, color: Colors.purple);
  }

  //Returns the list within a specific date
  List<Event> eventsInDay(Date date)
  {
    List<Event> temp = new List<Event>();

    for(Event eve in events)
      {
        if(eve.date.year() == date.year() && eve.date.month() == date.month() && eve.date.day() == date.day())
          {
            temp.add(eve);
          }
      }
    for(Event eve in temp)
    {


    }
    temp = eventsInDayOrg(temp);


    return temp;
  }

  //Orders the list based off of the starting time
  List<Event> eventsInDayOrg(List<Event> eves)
  {
    List<Event> temp = List<Event>(eves.length);
    List<int> times = new List<int>();

    for(Event eve in eves)
      {

        times.add(minutes(eve));

      }



    times.sort();




    for(Event eve in eves)
    {
      for (int i = 0; i < times.length; i++)
      {



        if(minutes(eve) == times[i])
          {
            temp[i] = eve;

          }
      }
    }



    return temp;
  }

//Returns day time in all minutes for easy comparisons
  int minutes(Event eve)
  {
    int temp = 0;

    return temp;
  }

}

class Formats
{
  String dayFormatted(int num)
  {
    String temp;
    if(num < 10)
    {
      temp = '0' + num.toString();
    }
    else
    {
      temp = num.toString();
    }
    return temp;
  }

  Date date(String month, int dayNum, String year)
  {
    return Date(input: month + '/' + Formats().dayFormatted(dayNum) + '/' + year);
  }

  //Parses the computer time
  Date systemDate()
  {
    String month = '';
    String day = '';
    String year = '';
    String data = DateTime.now().toString();

    day = data.substring(8,10);
    month = data.substring(5,7);
    year = data.substring(0,4);



    return date(month, int.parse(day), year);


  }
}





