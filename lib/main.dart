import 'package:flames/falmes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flames App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flames Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String flamesValue = 'Loading';

  FocusNode secondnameFocusNode;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: firstnameController,
                style: textStyle,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(secondnameFocusNode),
                decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: secondnameController,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Second Name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$flamesValue',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Flames'),
        onPressed: () {
          Flames flames =
              new Flames(firstnameController.text, secondnameController.text);
          flamesValue = flames.getflames();
          setState(() {});
        },
        icon: Icon(Icons.leak_add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
