import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/components/bmi_container.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/components/button_widget.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/components/colculator_container.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/components/resault_page.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_colors.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_sized_box.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_text_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 0;
  bool isFemale = false;
  int salmak = 0;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgc,
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 39,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BmiContainer(
                    onTap: () {
                      setState(() {
                        isFemale = false;
                      });
                    },
                    icon: Icons.male,
                    text: 'MALE',
                    isFemale: !isFemale),
                BmiContainer(
                  onTap: () {
                    setState(() {
                      isFemale = true;
                    });
                  },
                  icon: Icons.female,
                  text: 'FEMALE',
                  isFemale: isFemale,
                ),
              ],
            ),
            AppSize.h18,
            Container(
              width: 335,
              height: 176,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: AppTextStyles.textstylaehe,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentSliderValue.toStringAsFixed(0),
                        style: AppTextStyles.smTextStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'cm',
                          style: AppTextStyles.smmTextStyle,
                        ),
                      )
                    ],
                  ),
                  Slider(
                    inactiveColor: Colors.grey,
                    activeColor: Colors.white,
                    thumbColor: Colors.red,
                    value: _currentSliderValue,
                    max: 295,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            AppSize.h18,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 155,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: AppTextStyles.textstylaehe,
                      ),
                      Text(
                        '$salmak',
                        style: AppTextStyles.smTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonWiget(
                              icons: Icons.remove,
                              onTap: () {
                                setState(() {
                                  salmak--;
                                });
                              }),
                          ButtonWiget(
                              icons: Icons.add,
                              onTap: () {
                                setState(() {
                                  salmak++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 155,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: AppTextStyles.textstylaehe,
                      ),
                      Text(
                        '$age',
                        style: AppTextStyles.smTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonWiget(
                              icons: Icons.remove,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          ButtonWiget(
                            icons: Icons.add,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalcualtorContainer(
        onTap: () {
          final result = salmak / pow(_currentSliderValue / 100, 2);
          if (result < 18.5) {
            showMyDialog(
              context: context,
              result: result,
              text: 'сенин салмагын аз. Көп тамактан',
            );
          } else if (result >= 18.5 && result <= 25.9) {
            showMyDialog(
              context: context,
              result: result,
              text: 'сенин салмагын жакшы. Азамат',
            );
          } else if (result > 25.9) {
            showMyDialog(
              context: context,
              result: result,
              text: 'сенин салмагын көп . Спорт менен машык',
            );
          } else {
            showMyDialog(
              context: context,
              result: result,
              text: 'каталык бар',
            );
          }
        },
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: AppColors.appBarBgc,
      centerTitle: true,
      title: const Text(
        'BMI CALCULATOR',
        style: AppTextStyles.bmiTextStyle,
      ),
    );
  }
}
