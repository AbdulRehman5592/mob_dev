import 'package:flutter/material.dart';

class MeritScreen extends StatefulWidget {
  const MeritScreen({super.key});

  @override
  State<MeritScreen> createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  bool isInterSelected = true;
  bool isOlevelSelected = false;
  late List<bool> isSelectedFlags;
  TextEditingController isInter = TextEditingController();
  TextEditingController isEntrytest = TextEditingController();
  String InterText2 = "please Enter the marks of intermediate";
  String OlevelText = "please Enter the marks of O-level";
  String hintText = "";
  String computedMerit = "2";

  @override
  void initState() {
    super.initState();
    isSelectedFlags = [true, false];
  }

  @override
  Widget build(BuildContext context) {
    if (isInterSelected) {
      hintText = InterText2;
    } else
      hintText = OlevelText;
    return Scaffold(
        appBar: AppBar(
            title: Text("Merit Screen"), backgroundColor: Colors.purpleAccent),
        body: Center(
          child: Column(
            children: [
              ToggleButtons(
                children: [Text("intermediate"), Text("O-level")],
                isSelected: isSelectedFlags,
                onPressed: (index) {
                  switch (index) {
                    case 0:
                      isInterSelected = true;
                      isOlevelSelected = false;
                      break;
                    case 1:
                      isInterSelected = false;
                      isOlevelSelected = true;
                      break;
                    default:
                  }
                  setState(() {
                    isSelectedFlags = [isInterSelected, isOlevelSelected];
                  });
                },
              ),
              TextField(
                controller: isInter,
                decoration: InputDecoration(hintText: hintText),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: isEntrytest,
                decoration: InputDecoration(
                    hintText: "please Enter the marks of entry test"),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: onMeritButtonPress,
                  child: Text("Calculate Merit")),
              Text(computedMerit)
            ],
          ),
        ));
  }

  void onMeritButtonPress() {
    if (isInterSelected) {
      double interMarks = double.tryParse(isInter.text) ?? 0;
      double EnterMarks = double.tryParse(isEntrytest.text) ?? 0;

      double merit = ((interMarks / 1100) * 0.6) + ((EnterMarks / 30) * 0.4);

      setState(() {
        computedMerit = merit.toStringAsFixed(3);
      });
    } else {
      double OlevelMarks = double.tryParse(isInter.text) ?? 0;
      double EnterMarks = double.tryParse(isEntrytest.text) ?? 0;

      double merit =
          (((OlevelMarks / 1100) * 0.6) + ((EnterMarks / 30) * 0.4)) * 100;

      setState(() {
        computedMerit = merit.toStringAsFixed(3);
      });
    }
  }
}
