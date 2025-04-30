import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travia/data/api.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/widgets/custom_button.dart';

class QnsScreen extends StatefulWidget {
  QnsScreen({super.key, required this.categoryType});
  String categoryType;

  @override
  State<QnsScreen> createState() => _QnsScreenState();
}

class _QnsScreenState extends State<QnsScreen> {
  // List<Map<String, dynamic>> dataReceived = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCorrectData();
    });
  }

  var i = 0;

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

  @override
  Widget build(BuildContext context) {
    debugPrint(
        '-----------------------------------------------------> This :::: ${result != null ? result[0]["question"] : 'Raakib'}\n\n\n');
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
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                )
              ],
            ),
            CustomButton(
              onPressed: () async {
                setState(() {
                  if (i < result.length - 1) {
                    i++;
                  } else {
                    i = 0;
                  }
                });
              },
              text: "True",
              color: true,
              gradient: false,
            ),
            CustomButton(
              onPressed: () {
                setState(() {
                  if (i < result.length - 1) {
                    i++;
                  } else {
                    i = 0;
                  }
                });
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
