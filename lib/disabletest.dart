import 'package:flutter/material.dart';

/*
void main() {
  runApp(App());
}
*/

void main() => runApp(
    MaterialApp(
        home: MyHomePage()
    )
);

/*class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enable and Disable Button in Flutter Tutorial - FlutterCorner',
      home: FlutterExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/

/*
class FlutterExample extends StatefulWidget {
  //FlutterExample({Key  key}) : super(key: key);

  @override
  _FlutterExampleState createState() => _FlutterExampleState();
}

class _FlutterExampleState extends State<FlutterExample> {
  bool status = true;

  disableButton() {
    setState(() {
      status = false;
    });
  }

  enableButton() {
    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enable / Disable Button - FlutterCorner'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
*/
/*              RaisedButton(
                onPressed: status ? () => () {} : null,
                color: Colors.pinkAccent,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Sample Button'),
              ),*//*

              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: status ? null : enableButton,
                color: Colors.lightGreen,
                textColor: Colors.white,
                child: Text('Click Here To Enable Button'),
              ),
              RaisedButton(
                onPressed: status == false ? null : disableButton,
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Click Here To Disable Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  void _incrementCounter() {
    setState(() {
      _isButtonDisabled = true;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("The App"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              //style: Theme.of(context).textTheme.display1,
            ),
            _buildCounterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton() {
    return new RaisedButton(
      child: new Text(
          _isButtonDisabled ? "Hold on..." : "Increment"
      ),
      onPressed: _isButtonDisabled ? null : _incrementCounter,
    );
  }
}