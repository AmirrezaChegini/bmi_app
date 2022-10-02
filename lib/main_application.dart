import 'package:bmi_app/anim/scale_anim.dart';
import 'package:flutter/material.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  double height = 170;
  double weight = 50;
  int age = 20;
  double bmi = 0;
  Color colorBmi = Colors.white;
  List<Color> genderColor = [Colors.white, Colors.white];
  String gender = '';
  String result = '';
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('BMI Calculator'),
      centerTitle: true,
    );
  }

  Widget _getBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: _getGender()),
            Expanded(flex: 3, child: _getHeight()),
            Expanded(flex: 3, child: _getWeight()),
            Expanded(flex: 1, child: _getCal()),
          ],
        ),
        _resultWidget(),
      ],
    );
  }

  Widget _resultWidget() {
    return ScaleAnim(
      isClicked: isClicked,
      child: Container(
        height: 300,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gender,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                color: colorBmi,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  isClicked = false;
                });
              },
              child: Text('Close'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigo[900],
                minimumSize: Size(100, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getGender() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                gender = 'Male';
                genderColor[0] = Color(0xffE91E63);
                genderColor[1] = Colors.white;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.male,
                  size: 80,
                  color: genderColor[0],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                gender = 'Female';
                genderColor[1] = Color(0xffE91E63);
                genderColor[0] = Colors.white;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Center(
                  child: Icon(
                    Icons.female,
                    size: 80,
                    color: genderColor[1],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getHeight() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.indigo[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HEIGHT ',
            style: TextStyle(fontSize: 22, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${height.toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'cm',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Slider(
            value: height,
            onChanged: (value) => updateHeight(value),
            min: 150,
            max: 210,
            thumbColor: Colors.pink[500],
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _getWeight() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WEIGHT',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  '${weight.toStringAsFixed(0)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => updateWeight('+'),
                      child: Icon(Icons.add),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400],
                        shape: CircleBorder(),
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateWeight('-'),
                      child: Icon(Icons.remove),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400],
                        shape: CircleBorder(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.indigo[500],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AGE',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  '$age',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => updateAge('+'),
                      child: Icon(Icons.add),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400],
                        shape: CircleBorder(),
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateAge('-'),
                      child: Icon(Icons.remove),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400],
                        shape: CircleBorder(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _getCal() {
    return TextButton(
      onPressed: () => updateBmi(),
      child: Text('Calculate'),
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink[500],
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }

  void updateHeight(double x) {
    setState(() {
      height = x.roundToDouble();
    });
  }

  void updateWeight(String x) {
    setState(() {
      x == '+' ? weight += 1 : weight -= 1;
    });
  }

  void updateAge(String x) {
    setState(() {
      x == '+' ? age += 1 : age -= 1;
    });
  }

  void updateBmi() {
    setState(() {
      bmi = (weight / (height * height)) * 10000;
      bmi >= 18 && bmi < 25 ? colorBmi = Colors.green : colorBmi = Colors.red;
      updateResult();
      isClicked = true;
    });
  }

  void updateResult() {
    setState(() {
      if (bmi < 18) {
        result = 'You are Thin';
      } else if (bmi >= 18 && bmi <= 25) {
        result = 'You are in Shape';
      } else {
        result = 'You are Fat';
      }
    });
  }
}
