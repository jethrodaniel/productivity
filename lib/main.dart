import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class Duration {
  final double hours, minutes;
  Duration(this.hours, this.minutes);
  @override
  String toString() {
    return "$hours h, $minutes m";
  }
}

class ScheduleMath {
  final Duration treatment_time;
	final double rate;

  Duration total_time() {
    if (treatment_time.hours == null)
      return Duration(9, 9);
	  var treatment_time_min = treatment_time.hours * 60 + treatment_time.minutes;
		var total_min = treatment_time_min / rate;
      return Duration(treatment_time_min, rate);
		var h = (total_min / 60.0);
		var m = (total_min - h * 60);

    /* if (m >= 60) { */
    /*   h += (m / 60).floor(); */
    /*   m -= (((m/60) - (m / 60).floor()) * 60).round(); */
    /* } */

    return Duration(h, m);
  }
  ScheduleMath(this.treatment_time, this.rate);
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
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
  double hours, minutes, rate;
  ScheduleMath sched;

  Widget _numericInput(String name, Function(String) saveFunc) {
    return TextFormField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: name,
      ),
      keyboardType: new TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value.isEmpty)
          return 'Enter a value';
        return null;
      },
      onSaved: saveFunc
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          setState(() => sched = ScheduleMath(Duration(hours, minutes), rate));

          _formKey.currentState.save();

          var tx_min = hours * 60 + minutes;
          var r = rate / 100;
          var total_min = tx_min / r;
          var h = (total_min / 60).floor();
          var m = total_min - h * 60;

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: Text("Results")),
                  body: //Center(child:
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
												Divider(color: Colors.blue,thickness: 2),
                        Container(padding: EdgeInsets.all(20), child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('tx = r (T)', textScaleFactor: 2, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('T = tx / r', textScaleFactor: 2, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                        ])),
												Divider(color: Colors.blue, thickness: 2),
                        Container(padding: EdgeInsets.all(25), child:
                          Column(children: [
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
																RichText(
																  text: TextSpan(style: TextStyle(fontSize: 20.0), children: [
                                    TextSpan(text: 'Treatment '),
                            		    TextSpan(text: '(tx)', style: TextStyle(fontStyle: FontStyle.italic)),
																	])
																)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('${ScheduleMath(Duration(hours, minutes), rate).treatment_time}', textScaleFactor: 1.5),
                              ]))
                            ]),
                            SizedBox(height: 30),
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
																RichText(
																  text: TextSpan(style: TextStyle(fontSize: 20.0), children: [
                                    TextSpan(text: 'Rate '),
                            		    TextSpan(text: '(r)', style: TextStyle(fontStyle: FontStyle.italic)),
																	])
																)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('$rate% = ${rate / 100}', textScaleFactor: 1.5)
                              ]))
                            ]),
                            SizedBox(height: 30),
                            Row(children: [
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
																RichText(
																  text: TextSpan(style: TextStyle(fontSize: 20.0), children: [
                                    TextSpan(text: 'Total '),
                            		    TextSpan(text: '(T)', style: TextStyle(fontStyle: FontStyle.italic)),
																	])
																)
                              ])),
                              Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children :[
                                Text('${ScheduleMath(Duration(hours, minutes), rate).total_time()}', textScaleFactor: 1.5),
                              ]))
                            ]),
                          ]),
                        ),
                        Divider(color: Colors.blue,thickness: 2),
                        Container(padding: EdgeInsets.all(20), child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('${Duration(hours, minutes)} = ${rate / 100} (T)', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('${tx_min}m = ${r} (T)', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('${tx_min}m / ${r} (T)', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('T = ${total_min}m', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('T = ${h}h ${m}m', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('T = tx / r', textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                        ])),
												Divider(color: Colors.blue, thickness: 2),
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
      child:
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment : MainAxisAlignment.spaceEvenly,
          children: [
            Text('Enter Treatment Time', textScaleFactor: 2),
            //Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //  _numericInput("Hours", (val) => setState(() => hours = int.parse(val))),
						//])),
            Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                SizedBox(height: 30),
                _numericInput("Hours", (val) => setState(() => hours = double.parse(val))),
                SizedBox(height: 30),
                _numericInput("Minutes", (val) => setState(() => minutes = double.parse(val))),
                SizedBox(height: 30),
                _numericInput("Rate (%)", (val) => setState(() => rate = double.parse(val))),
                SizedBox(height: 30),
                _submitButton()
              ]
            ),
          ],
        )
      )
    );
  }
}

