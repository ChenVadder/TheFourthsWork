import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  static const NKeys = [
    "C", "D", "?", "/", //
    "9", "8", "7", "*", //,
    "6", "5", "4", "-", //
    "3", "2", "1", "+", //
    "", "0", ".", "=", //
  ];

//顶部按钮
  static const TKeys = [
    "C",
    "D",
    "?",
  ];
  //中部按钮
  static const MKeys = [
    "9", "8", "7", //,
    "6", "5", "4", //
    "3", "2", "1", //
    "", "0", ".",
  ];
//右侧按钮
  static const RKeys = ["/", "*", "-", "+", "="];

  IndexPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "φ(>ω<*) 计算器",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "HYZZSDX", //自定义字体1
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Expanded(
                child: Center(
                    child: Text("(｀・ω・´)开始计算吧",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "HYZZZQPK", //自定义字体2
                          fontSize: 25,
                        )))),
            Center(child: _buildButtons())
          ],
        ),
      ),
    );
  }
}

Widget buildButton(String num, {int flex = 1}) {
  return Expanded(
      flex: flex,
      child: MaterialButton(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          num,
          textScaleFactor: IndexPage.RKeys.contains(num) ? 2.5 : 1.5,
        ),
        shape: flex > 1
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000.0),
              )
            : const CircleBorder(),
        minWidth: flex > 1 ? 50 : 50,
        height: flex > 1 ? 80 : 95,
        textColor: IndexPage.MKeys.contains(num) ? Colors.white : Colors.blue,
        //highlightColor: Colors.yellow,
        color: IndexPage.TKeys.contains(num)
            ? Colors.white
            : IndexPage.RKeys.contains(num)
                ? Colors.orange // IndexPage.RIGHT_BTN_BG
                : const Color.fromARGB(255, 49, 49, 49), //IndexPage.NUM_BTN_BG,
        splashColor: Colors.grey,
        elevation: 10.0,
        highlightElevation: 20.0,
        onPressed: () {}, //TODO
      ));
}

Widget _buildButtons() {
  List<Widget> rows = [];
  List<Widget> btns = [];
  int flex = 1;
  for (int i = 0; i < IndexPage.NKeys.length; i++) {
    String key = IndexPage.NKeys[i];
    if (key.isEmpty) {
      flex++;
      continue;
    } else {
      Widget b = buildButton(key, flex: flex);
      btns.add(b);
      flex = 1;
    }

    if ((i + 1) % 4 == 0) {
      rows.add(Row(
        children: btns,
      ));
      btns = [];
    }
  }
  if (btns.isNotEmpty) {
    rows.add(Row(
      children: btns,
    ));
    btns = [];
  }

  return Column(
    children: rows,
  );
}
