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
  List<Map<String, dynamic>> dataReceived = [];
  var result;

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
      if (result != null) {
        debugPrint(
            '-------> Fetch General Knowledge Questions\nQuestions : $result');
      } else {
        debugPrint('------------> Error While Hitting API');
      }
    }
  }
// still got an error

  // questions() {
  //   setState(() {
  //     if (result != null) {
  //       result.forEach((element) {
  //         dataReceived.add(element['question']);
  //         debugPrint("------> question updated ${element['question']}");
  //       });
  //     }
  //     // for (var i = 0; i < result.length; i++) {
  //     //   dataReceived.add(result[i]['question']);
  //     // debugPrint("--------question updated $dataReceived");
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('--------> This :::: ${result[0] ?? 'Raakib'}\n\n\n');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Text(result[index]['question'].toString());
                  },
                )),
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
                // debugPrint(
                //     '-----> Inside Function Call -----> Data : $dataReceived');
              },
              text: "True",
              color: true,
              gradient: false,
            ),
            CustomButton(
              onPressed: () {},
              color: true,
              gradient: false,
            )
          ],
        ),
      ),
    );
  }
}
