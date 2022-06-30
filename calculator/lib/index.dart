import 'package:flutter/material.dart';
import 'package:calculator/cal.dart';

class IndexPage extends StatefulWidget {
  static const Color PAGE_COLOR = Colors.black;

  // 按钮
  static const Color NUM_BTN_BG = Color(0xff323232);

  //顶部按钮
  static const Color TOP_BTN_BG = Color(0xFFa6a6a6);

  //右侧按钮
  static const Color RIGHT_BTN_BG = Color(0xFFff9500);

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

  @override
  IndexPageState createState() {
    return new IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  String _num = "";

  Cal _cal = new Cal();

  void clickKey(String key) { //传值函数，点击按钮添加在已有的_num尾部
    _cal.addKey(key);
    setState(() {
      _num = _cal.OutPut;
    });
  }

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
            Expanded(
                child: SingleChildScrollView( //如果输入/计算数字过多，应该有滚动功能
                    reverse: true,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Align(
                            alignment: Alignment.bottomRight, //输入/计算数字在显示区域底部右侧
                            child: Text("$_num",
                                style: const TextStyle( //输入/计算数字
                                  color: Colors.black,
                                  fontSize: 32.0,
                                )))))),
            Center(child: _buildButtons()),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String num, {int flex = 1}) {
    return Expanded(
        flex: flex,
        child: MaterialButton(
          onPressed: () {
            clickKey(num);
          },
          padding: const EdgeInsets.all(20.0), //各按键之间间隙置为20
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
                  : const Color.fromARGB(
                      255, 49, 49, 49), //IndexPage.NUM_BTN_BG,
          splashColor: Colors.grey,
          elevation: 10.0,
          highlightElevation: 20.0,
          //TODO
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
}
