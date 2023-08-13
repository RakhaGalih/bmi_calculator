import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/bottom_button.dart';
import '../component/icon_content.dart';
import '../component/round_icon_button.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender _selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          onPressed: () {
                            setState(() {
                              _selectedGender = Gender.male;
                            });
                          },
                          colour: (_selectedGender == Gender.male)
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: const IconContent(
                              icon: FontAwesomeIcons.mars, label: 'MALE'))),
                  Expanded(
                      child: ReusableCard(
                          onPressed: () {
                            setState(() {
                              _selectedGender = Gender.female;
                            });
                          },
                          colour: (_selectedGender == Gender.female)
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: const IconContent(
                              icon: FontAwesomeIcons.venus, label: 'FEMALE')))
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              onPressed: () {},
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextSTyle),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: kBottomContainerColor,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPressed: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextSTyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextSTyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: calc.calculateBMI(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                },
                buttonTitle: 'CALCULATE')
          ],
        ));
  }
}
