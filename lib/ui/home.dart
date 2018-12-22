import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _inches = 0.0;
  double _calculatedBMI = 0.0;
  String _calculatedBMIStatus = "Overweight";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);

      double height = double.parse(_heightController.text);
      _inches = (height * 12);

      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0.0) &&
          (_heightController.text.isNotEmpty || _inches > 0.0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        _calculatedBMI = (weight / (_inches * _inches) * 703);

        double _currentCalculatedBMI =
            double.parse(_calculatedBMI.toStringAsFixed(1));

        if (_currentCalculatedBMI < 18.5) {
          _calculatedBMIStatus = "Underweight";
        } else if (_currentCalculatedBMI >= 18.5 &&
            _currentCalculatedBMI < 25.0) {
          _calculatedBMIStatus = "Normal";
        } else if (_currentCalculatedBMI >= 25.0 &&
            _currentCalculatedBMI < 30.0) {
          _calculatedBMIStatus = "Overweight";
        } else if (_currentCalculatedBMI >= 30.0) {
          _calculatedBMIStatus = "Obese";
        }
      } else {
        _calculatedBMI = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI App"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: const EdgeInsets.all(2.0),
            children: <Widget>[
              Image.asset(
                'images/bmilogo.png',
                height: 85.0,
                width: 75.0,
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                height: 255.0,
                width: 290.0,
                color: Colors.grey.shade300,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g.: 34',
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'e.g.: 6.5',
                        icon: Icon(Icons.insert_chart),
                      ),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight in lbs',
                        hintText: 'e.g.: 180',
                        icon: Icon(Icons.line_weight),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(11.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: _calculateBMI,
                        color: Colors.pinkAccent,
                        child: Text('Calculate'),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your BMI: ${_calculatedBMI.toStringAsFixed(1)}',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Text(
                    '$_calculatedBMIStatus',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
