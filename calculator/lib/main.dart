import 'package:flutter/material.dart';
import 'index.dart';
import 'FormTest.dart';

main() => runApp(WBLMaterialApp());

class WBLMaterialApp extends StatelessWidget {
  const WBLMaterialApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WBLHome(),
    );
  }
}

class WBLHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "实验5计算器",
        ),
      ),
      body: WBLBody(),
    );
  }
}

//WBLBody前不加_，暴露给其它人使用
class WBLBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return functionSelection();
  }
}

class functionSelection extends StatelessWidget {
  //功能选择
  //按钮函数
  Widget functionButton(BuildContext context, String text, Widget func) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 30,
              ),
              minimumSize: Size(300, 60)),
          child: Text(text),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewRoute(func);
              }),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        functionButton(context, '简易计算器', IndexPage()),
        SizedBox(
          height: 20,
        ), //使上下之间有间距
        functionButton(context, '税率计算器', FormTest()),
      ],
    );
  }
}

class NewRoute extends StatelessWidget {
  Widget func;

  NewRoute(Widget func) : super() {
    this.func = func;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: func,
    );
  }
}
