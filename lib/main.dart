import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
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
            Text(''), // todo: spacing?
            AppForm()
          ],
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class AppForm extends StatefulWidget {
  @override
  AppFormState createState() {
    return AppFormState();
  }
}

// https://flutter.dev/docs/cookbook/forms/validation
class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();
  final _normalFontSize = new TextStyle(fontSize: 36.0);

  Widget _numericInput(String name) {
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
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
					_formKey.currentState.save();
    			Navigator.of(context).push(
    			  MaterialPageRoute<void>(
    			    builder: (BuildContext context) {
								return Scaffold(
          			  appBar: AppBar(
          			    title: Text('Page Two'),
          			  ),
          			  body: Center(
          			    child: Text("wow!"),
          			  ),
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
            Text('Enter Scheduled Time', textScaleFactor: 2),
            SizedBox(height: 20),
            Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _numericInput("Hours"),
                SizedBox(height: 20),
                _numericInput("Minutes"),
                SizedBox(height: 20),
                _numericInput("Rate"),
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

