import 'package:bmicalculator/widgets/bottom_container.dart';
import 'package:bmicalculator/widgets/card_content.dart';
import 'package:bmicalculator/const/constants.dart';
import 'package:flutter/material.dart';

class CalculationPage extends StatelessWidget {
  CalculationPage(
      {@required this.bmiResult, @required this.result, @required this.sugg});

  final String bmiResult;
  final String result;
  final String sugg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              'Your Result',
              style: resultPageBoldText,
            ),
          ),
          Expanded(
            child: CardContent(
              color: selectedBGColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        result.toUpperCase(),
                        style: resultPageText1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmiResult,
                      style: resultPageText2,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Normal BMI Range :',
                        style: TextStyle(
                          color: unselectedTextColor,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(
                          color: selectedTextColor,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        sugg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTextColor,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomContainer(label: 'RE-CALCULATE YOUR BMI'),
          ),
        ],
      ),
    );
  }
}
