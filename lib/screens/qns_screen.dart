import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travia/data/api.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/screens/final_score_screen.dart';
import 'package:travia/widgets/custom_button.dart';

class QnsScreen extends StatefulWidget {
  QnsScreen({super.key, required this.categoryType});
  String categoryType;

  @override
  State<QnsScreen> createState() => _QnsScreenState();
}

var correct = 0;
var incorrect = 0;

class _QnsScreenState extends State<QnsScreen> {
  // List<Map<String, dynamic>> dataReceived = [];
  var i = 0;
  List<Widget> icon = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCorrectData();
    });
  }

  fetchCorrectData() async {
    if (widget.categoryType == 'General Knowledge') {
      result = await QuestionAPI().fetchapi("9");
      debugPrint("----------------------> API RESPONSE : $result");

      if (result != null) {
        debugPrint(
            '-------> Fetch General Knowledge Questions\nQuestions : $result');
      } else {
        debugPrint('------------> Error While Hitting API');
      }
      questions();
    }
  }

// still got an error

  questions() {
    setState(() {
      if (result != null && result is List) {
        result.forEach((element) {
          // dataReceived.add(element['question']);
          debugPrint("------> question updated ${element['question']}");
        });
      }
      // for (var i = 0; i < result.length; i++) {
      //   dataReceived.add(result[i]['question']);
      // debugPrint("--------question updated $dataReceived");
      // }
    });
  }

  resultforTrue() {
    if (result[i]["correct_answer"] == "True") {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Correct Answer")));

      setState(() {
        if (i < result.length - 1) {
          correct++;
          icon.add(Icon(
            FontAwesomeIcons.check,
            color: Colors.green,
          ));

          i++;
        } else {
          Timer(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FinalScoreScreen()));
            },
          );
        }
      });
      return icon;
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Incorrect Answer")));

      setState(() {
        if (i < result.length - 1) {
          incorrect++;
          icon.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          i++;
        } else {
          Timer(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FinalScoreScreen()));
            },
          );
        }
      });
      return icon;
    }
  }

  resultforFalse() {
    if (result[i]["correct_answer"] == "False") {
      setState(() {
        if (i < result.length - 1) {
          correct++;
          icon.add(Icon(
            FontAwesomeIcons.check,
            color: Colors.green,
          ));

          i++;
        } else {
          Timer(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FinalScoreScreen()));
            },
          );
        }
      });
      return icon;
    } else {
      setState(() {
        if (i < result.length - 1) {
          incorrect++;
          icon.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          i++;
        } else {
          Timer(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FinalScoreScreen()));
            },
          );
        }
      });
      return icon;
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(
    //     '-----------------------------------------------------> This :::: ${result != null ? result[0]["question"] : 'Raakib'}\n\n\n');
    debugPrint("----------------------> API RESPONSE : $result");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: result != null
                  ? Text(result[i]['question'].toString())
                  : Text("Loading Questions....."),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    // Text(icon.toString()),
                    icon.map((element) => element).toList(),
              ),
            ),

            // SizedBox(
            //   height: 60,
            //   width: double.infinity,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: result.length,
            //     itemBuilder: (context, index) {
            //       return Text(icon.toString());
            //     },
            //   ),
            // ),
            CustomButton(
              onPressed: () async {
                resultforTrue();
              },
              text: "True",
              color: true,
              gradient: false,
            ),
            CustomButton(
              onPressed: () {
                resultforFalse();
              },
              text: "False",
              color: false,
              gradient: false,
            )
          ],
        ),
      ),
    );
  }
}
