import 'package:bmicalculator/calculation.dart';
import 'package:bmicalculator/screen/calculation_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bottom_container.dart';
import '../widgets/card_content.dart';
import '../const/constants.dart';
import '../widgets/icon_content.dart';
import '../widgets/round_button.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int defaultSliderValue = 150;
  int weight = 65;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: CardContent(
                      color: selectedGender == Gender.male
                          ? selectedBGColor
                          : unselectedBGColor,
                      cardChild: IconContent(
                        color: selectedGender == Gender.male
                            ? selectedTextColor
                            : unselectedTextColor,
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: CardContent(
                      cardChild: IconContent(
                        color: selectedGender == Gender.female
                            ? selectedTextColor
                            : unselectedTextColor,
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      color: selectedGender == Gender.female
                          ? selectedBGColor
                          : unselectedBGColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContent(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        defaultSliderValue.toString(),
                        style: boldTextStyle,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: activeTrackColor,
                      inactiveTrackColor: inactiveTrackColor,
                      overlayColor: overlayColor,
                      thumbColor: thumbColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    ),
                    child: Slider(
                        value: defaultSliderValue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            defaultSliderValue = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContent(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: boldTextStyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: CardContent(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: boldTextStyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculation calc =
                  Calculation(height: defaultSliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalculationPage(
                    bmiResult: calc.calculateBMI(),
                    result: calc.getResult(),
                    sugg: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: BottomContainer(
              label: 'CALCULATE YOUR BMI',
            ),
          ),
        ],
      ),
    );
  }
}
