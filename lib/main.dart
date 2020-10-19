import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class Duration {
  final int hours, minutes;
  Duration(this.hours, this.minutes);
  @override
  String toString() {
    return "${hours}h, ${minutes}m";
  }
}

class ScheduleMath {
  final Duration treatment_time;
	final int rate;

  Duration total_time() {
    if (treatment_time.hours == null)
      return Duration(9, 9);
	  var treatment_time_min = treatment_time.hours * 60 + treatment_time.minutes;
		var total_min = treatment_time_min / rate;
		var h = (total_min / 60.0).floor();
		var m = (total_min - h * 60).floor();

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
  int hours, minutes, rate;
  ScheduleMath sched;

  Widget _numericInput(String name, Function(String) saveFunc) {
    return TextFormField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: name,
      ),
      //keyboardType: new TextInputType.numberWithOptions(decimal: true),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty)
          return 'Enter a value';
        return null;
      },
      onSaved: saveFunc
    );
  }

  Widget _formulaRow(parts) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(flex: 1, child: Column(children: [Text(parts[0], textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))],crossAxisAlignment: CrossAxisAlignment.end)),
      Expanded(flex: 1, child: Column(children: [Text(parts[1], textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))])),
      Expanded(flex: 4, child: Column(children: [Text(parts[2], textScaleFactor: 1.5, style: TextStyle(fontStyle: FontStyle.italic))],crossAxisAlignment: CrossAxisAlignment.start)),
    ]);
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
          var m = (total_min - h * 60).floor();

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: Text("Results")),
                  body: //Center(child:
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
												//Divider(color: Colors.blue,thickness: 2),
                        Container(padding: EdgeInsets.all(20), child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Column(children: [Text('Results', textScaleFactor: 2, style: TextStyle(fontStyle: FontStyle.italic))]),
                          ]),
                          SizedBox(height: 10),
                          //Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          //  Column(children: [Text('T = tx / r', textScaleFactor: 2, style: TextStyle(fontStyle: FontStyle.italic))]),
                          //]),
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
                                Text('${Duration(hours, minutes)}', textScaleFactor: 1.5),
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
                                Text('$rate%', textScaleFactor: 1.5)
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
                                Text('${Duration(h, m)}', textScaleFactor: 1.5),
                              ]))
                            ]),
                          ]),
                        ),
                        Divider(color: Colors.blue,thickness: 2),
                        Container(padding: EdgeInsets.all(20), child: Column(children: [
                          //_formulaRow(['treatment', '=', 'rate (total)']),
                          _formulaRow(['tx', '=', 'r (T)']),
                          _formulaRow(['r (T)', '=', 'tx']),
                          _formulaRow(['r (T)', '=', '${Duration(hours, minutes)}']),
                          _formulaRow(['r (T)', '=', '${hours}h * (60m/1h) + ${tx_min}m']),
                          _formulaRow(['r (T)', '=', '${tx_min}m']),
                          _formulaRow(['T', '=', '${tx_min}m / $r']),
                          _formulaRow(['T', '=', '${total_min.toStringAsFixed(2)}m']),
                          _formulaRow(['r (T)', '=', '${Duration(h, m)}']),
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
                _numericInput("Hours", (val) => setState(() => hours = int.parse(val))),
                SizedBox(height: 30),
                _numericInput("Minutes", (val) => setState(() => minutes = int.parse(val))),
                SizedBox(height: 30),
                _numericInput("Rate (%)", (val) => setState(() => rate = int.parse(val))),
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

