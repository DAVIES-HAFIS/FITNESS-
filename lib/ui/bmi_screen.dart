import 'package:flutter/material.dart';
import 'package:global_fitness_app/shared/menu_bottom.dart';
import 'package:global_fitness_app/shared/menu_drawer.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController _txtHeight = TextEditingController();
  final TextEditingController _txtWeight = TextEditingController();
  final double fontSize = 18.0;
  String result = "";
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = "";
  String weightMessage = " ";

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fitness4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ToggleButtons(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Metric',
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Imperial',
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                    ],
                    isSelected: isSelected,
                    onPressed: toogleUnits,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: _txtHeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: heightMessage,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: _txtWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: weightMessage,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                      onPressed: calcBMI,
                      child: Text(
                        'Calculate BMI',
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toogleUnits(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void calcBMI() {
    double bmi = 0;
    double height = double.tryParse(_txtHeight.text) ?? 0;
    double weight = double.tryParse(_txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = (weight * 703) / (height * height);
    }
    setState(() {
      result = 'Your BMI is '+ bmi.toStringAsFixed(2);
    });
  }
}
