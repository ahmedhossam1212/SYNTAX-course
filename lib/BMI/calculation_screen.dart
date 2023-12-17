import 'package:flutter/material.dart';
import 'package:syntax_course/Bmi/result.dart';
import 'package:syntax_course/EGYbest/utils/app_routs.dart';
import 'package:syntax_course/EGYbest/utils/colors.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  bool gender = true;
  double height = 60;
  int weight = 0;
  int age = 0;
  num result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI CALCULATOR"),
          backgroundColor: AppColors.darkBlue),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = true;
                    });
                    debugPrint("Male");
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: gender ? AppColors.pink : AppColors.darkBlue),
                    child: Column(children: [
                      Icon(
                        Icons.male,
                        size: 60,
                        color: AppColors.white,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    debugPrint("Female");
                    setState(() {
                      gender = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: gender ? AppColors.darkBlue : AppColors.pink),
                    child: Column(children: [
                      Icon(
                        Icons.female,
                        size: 60,
                        color: AppColors.white,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.darkBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "${height.round()} CM",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
                Slider(
                  thumbColor: AppColors.pink,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.grey,
                  label: "${height.round()}",
                  max: 250,
                  min: 60,
                  value: height,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.darkBlue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: TextStyle(fontSize: 20, color: AppColors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$weight",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.darkBlue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: TextStyle(fontSize: 20, color: AppColors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$age",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: AppColors.pink,
              onPressed: () {
                setState(() {
                  result = weight / (height * 100) * (height * 100);
                });

                navigatTo(
                    context,
                    ResultScreen(
                        result: result,
                        height: height,
                        age: age,
                        weight: weight,
                        gender: gender));
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
