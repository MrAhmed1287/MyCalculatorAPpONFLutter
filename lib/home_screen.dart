import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/components_file.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userinput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    MyButon(
                      title: 'AC',
                      onprees: () {
                        userinput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    MyButon(
                      title: '+/-',
                      onprees: () {
                        userinput = userinput + '+/-';
                        setState(() {});
                      },
                    ),
                    MyButon(
                        title: '%',
                        onprees: () {
                          userinput = userinput + '%';
                          setState(() {});
                        }),
                    MyButon(
                        title: '/',
                        color: Colors.orange,
                        onprees: () {
                          userinput = userinput + '/';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  children: [
                    MyButon(
                      title: '7',
                      onprees: () {
                        userinput = userinput + '7';
                        setState(() {});
                      },
                    ),
                    MyButon(
                      title: '8',
                      onprees: () {
                        userinput = userinput + '8';
                        setState(() {});
                      },
                    ),
                    MyButon(
                        title: '9',
                        onprees: () {
                          userinput = userinput + '9';
                          setState(() {});
                        }),
                    MyButon(
                        title: '*',
                        color: Colors.orange,
                        onprees: () {
                          userinput = userinput + '*';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  children: [
                    MyButon(
                      title: '4',
                      onprees: () {
                        userinput = userinput + '4';
                        setState(() {});
                      },
                    ),
                    MyButon(
                      title: '5',
                      onprees: () {
                        userinput = userinput + '5';
                        setState(() {});
                      },
                    ),
                    MyButon(
                        title: '6',
                        onprees: () {
                          userinput = userinput + '6';
                          setState(() {});
                        }),
                    MyButon(
                        title: '-',
                        color: Colors.orange,
                        onprees: () {
                          userinput = userinput + '-';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  children: [
                    MyButon(
                      title: '1',
                      onprees: () {
                        userinput = userinput + '1';
                        setState(() {});
                      },
                    ),
                    MyButon(
                      title: '2',
                      onprees: () {
                        userinput = userinput + '2';
                        setState(() {});
                      },
                    ),
                    MyButon(
                        title: '3',
                        onprees: () {
                          userinput = userinput + '3';
                          setState(() {});
                        }),
                    MyButon(
                        title: '+',
                        color: Colors.orange,
                        onprees: () {
                          userinput = userinput + '+';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  children: [
                    MyButon(
                      title: '0',
                      onprees: () {
                        userinput = userinput + '0';
                        setState(() {});
                      },
                    ),
                    MyButon(
                      title: '.',
                      onprees: () {
                        userinput = userinput + '.';
                        setState(() {});
                      },
                    ),
                    MyButon(
                        title: 'DEL',
                        onprees: () {
                          setState(() {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          });
                        }),
                    MyButon(
                        title: '=',
                        color: Colors.orange,
                        onprees: () {
                          equalpres();
                          setState(() {});
                        }),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void equalpres() {
    String salamuserinput = userinput;
    salamuserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(userinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
