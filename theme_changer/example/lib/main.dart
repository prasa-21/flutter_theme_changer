import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Theme Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _appBarColor = Colors.blue; // Default app bar color
  Color _bgColor = Colors.blue; // Default background color
  Color _buttonColor = Colors.blue; // Default button color

  void _openColorPicker(Color initialColor, ValueChanged<Color> onColorChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color selectedColor = initialColor;

        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                selectedColor = color;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                onColorChanged(selectedColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openAppbarColorPicker() {
    _openColorPicker(_appBarColor, (Color color) {
      setState(() => _appBarColor = color);
    });
  }

  void _openBgColorPicker() {
    _openColorPicker(_bgColor, (Color color) {
      setState(() => _bgColor = color);
    });
  }

  void _openButtonColorPicker() {
    _openColorPicker(_buttonColor, (Color color) {
      setState(() => _buttonColor = color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Theme Changer'),
        centerTitle: true,
        backgroundColor: _appBarColor, // Set the AppBar color dynamically
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App content goes here!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      appBarColor: _appBarColor,
                      bgColor: _bgColor,
                      buttonColor: _buttonColor,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _buttonColor, // Set the button color dynamically
              ),
              child: Text('Go to Second Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(
                      appBarColor: _appBarColor,
                      bgColor: _bgColor,
                      buttonColor: _buttonColor,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _buttonColor, // Set the button color dynamically
              ),
              child: Text('Go to Third Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAppbarColorPicker();
          _openBgColorPicker();
          _openButtonColorPicker();
        },
        tooltip: 'Change Theme',
        child: Icon(Icons.color_lens),
      ),
      // Apply the selected color as the primary color of the app
      backgroundColor: _bgColor,
    );
  }
}

class SecondPage extends StatelessWidget {
  final Color appBarColor;
  final Color bgColor;
  final Color buttonColor;

  SecondPage({required this.appBarColor, required this.bgColor, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: appBarColor, // Set the AppBar color dynamically
      ),
      body: Center(
        child: Text(
          'Second Page content goes here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      // Apply the selected color as the primary color of the app
      backgroundColor: bgColor,
    );
  }
}

class ThirdPage extends StatelessWidget {
  final Color appBarColor;
  final Color bgColor;
  final Color buttonColor;

  ThirdPage({required this.appBarColor, required this.bgColor, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        backgroundColor: appBarColor, // Set the AppBar color dynamically
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Text',
                prefixIcon: Icon(Icons.text_fields), // Add icon to text field
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button functionality here
              },
              style: ElevatedButton.styleFrom(
                primary: buttonColor, // Set the button color dynamically
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      // Apply the selected color as the primary color of the app
      backgroundColor: bgColor,
    );
  }
}
