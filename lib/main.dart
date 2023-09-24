import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ignore_for_file: prefer_const_constructors, camel_case_types



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: callator(),
    );
  }
}

class callator extends StatefulWidget {
  const callator({super.key});

  @override
  State<callator> createState() => _callatorState();
}

class _callatorState extends State<callator> {
  String t = "0";
  double num1 = 0;
  double num2 = 0;
  String r = "";

  String fp = "";
  String op = "";
  String fo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
      ),
      backgroundColor: Colors.white,
      body: Container(
          color: Color.fromARGB(234, 145, 135, 135),
          margin: EdgeInsets.all(80),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          //borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: Color.fromARGB(255, 3, 18, 226),
                        ),
                        child: Center(
                          child: Text(
                            t,
                            style: TextStyle(
                              color: Color.fromARGB(255, 153, 28, 24),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mybuttom("1"),
                mybuttom("2"),
                mybuttom("3"),
                mybuttom("/"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mybuttom("4"),
                mybuttom("5"),
                mybuttom("6"),
                mybuttom("*"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mybuttom("7"),
                mybuttom("8"),
                mybuttom("9"),
                mybuttom("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mybuttom("."),
                mybuttom("0"),
                mybuttom("00"),
                mybuttom("+"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mybuttom("clear"),
                mybuttom("="),
              ],
            ),
          ])),
    );
  }

  Widget mybuttom(buttT) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 15),
      child: ElevatedButton(
        onPressed: () {
          calculat(buttT);
        },
        child: Text(
          buttT,
          style: TextStyle(
              color: Color.fromARGB(255, 216, 119, 28),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void calculat(tButtun) {
    if (tButtun == 'clear') {
      t = '0';
      num1 = 0;
      num2 = 0;
      r = '';
      fp = '0';
      op = '';
    } else if (op == '=' && tButtun == '=') {
      switch (fo) {
        case "+":
          fp = add();

          break;
        case "-":
          fp = sub();
          break;
        case "*":
          fp = mult();
          break;
        case "/":
          fp = div();
          break;
      }
    } else if (tButtun == '+' ||
        tButtun == '-' ||
        tButtun == '*' ||
        tButtun == '/' ||
        tButtun == '=') {
      if (num1 == 0) {
        num1 = double.parse(r);
      } else {
        num2 = double.parse(r);
      }
      switch (op) {
        case "+":
          fp = add();

          break;
        case "-":
          fp = sub();
          break;
        case "*":
          fp = mult();
          break;
        case "/":
          fp = div();
          break;
      }
      fo = op;
      op = tButtun;
      r = '';
    } else {
      r += tButtun;
      fp = r;
    }
    setState(() {
      t = fp;
    });
  }

  String add() {
    r = (num1 + num2).toString();
    num1 = double.parse(r);
    return r;
  }

  String sub() {
    r = (num1 - num2).toString();
    num1 = double.parse(r);
    return r;
  }

  String mult() {
    r = (num1 * num2).toString();
    num1 = double.parse(r);
    return r;
  }

  String div() {
    r = (num1 / num2).toString();
    num1 = double.parse(r);
    return r;
  }
}
