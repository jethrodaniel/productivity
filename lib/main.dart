import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class Duration {
  final int hours, minutes;
  Duration(this.hours, this.minutes);
  @override
  String toString() {
    return "$hours hours, $minutes minutes";
  }
}

class ScheduleMath {
}

class App extends StatelessWidget {
  final _title = 'Productivity';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.dark(),
      home: HomePage(title: _title),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AppForm()
          ],
        ),
      ),
    );
  }
}

class AppForm extends StatefulWidget {
  @override
  AppFormState createState() {
    return AppFormState();
  }
}

// https://flutter.dev/docs/cookbook/forms/validation
class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();
  int hours, minutes, rate;

  Widget _numericInput(String name, Function(String) saveFunc) {
    return TextFormField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: name,
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter a value';
        return null;
      },
      onSaved: saveFunc
    );
  }



  Widget _submitButton() {
    var d = Duration(hours, minutes);
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: Text("Results")),
                  body: //Center(child:
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(padding: EdgeInsets.all(20), child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('x = rT', textScaleFactor: 2)]),
                          ]),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('T = x / r', textScaleFactor: 2)]),
                          ]),
                        ])),
                        Container(padding: EdgeInsets.all(25), child:
                          Column(children: [
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('Treatment (x)', textScaleFactor: 1.5)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('${d.hours} h, ${d.minutes} m', textScaleFactor: 1.5),
                              ]))
                            ]),
                            SizedBox(height: 20),
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('Rate (r)', textScaleFactor: 1.5)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('$rate%', textScaleFactor: 1.5)
                              ]))
                            ]),
                            SizedBox(height: 20),
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('Total (T)', textScaleFactor: 1.5)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('${d.hours} h, ${d.minutes} m', textScaleFactor: 1.5),
                              ]))
                            ]),

                          ]),
                        )
                    ])
                );
              },
            ),
          );
        }
      },
      child: Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child:
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Enter Treatment Time', textScaleFactor: 2),
            SizedBox(height: 20),
            Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _numericInput("Hours", (val) => setState(() => hours = int.parse(val))),
                SizedBox(height: 20),
                _numericInput("Minutes", (val) => setState(() => minutes = int.parse(val))),
                SizedBox(height: 20),
                _numericInput("Rate", (val) => setState(() => rate = int.parse(val))),
                SizedBox(height: 20),
                _submitButton()
              ]
            ),
          ],
        )
      )
    );
  }
}

