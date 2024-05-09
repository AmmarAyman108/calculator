import 'package:calculator/helper/custom_app_bar.dart';
import 'package:calculator/helper/output.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String input = '', output = '';
  final List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: CustomAppBar(title: 'Calculator'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Output(alignment: Alignment.centerLeft, text: input),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: Output(alignment: Alignment.centerRight, text: output),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: symbols.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (symbols[index] == 'C') {
                          setState(() {
                            input = '';
                            output = '';
                          });
                        } else if (symbols[index] == 'Del') {
                          if (input == '') {
                            null;
                          } else {
                            setState(() {
                              input = input.substring(0, input.length - 1);
                            });
                          }
                        } else if (symbols[index] == '=') {
                          if (input == ' ' ||
                              input.endsWith('+') ||
                              input.startsWith('+') ||
                              input.endsWith('-') ||
                              input.startsWith('-') ||
                              input.endsWith('/') ||
                              input.startsWith('/') ||
                              input.endsWith('%') ||
                              input.startsWith('%') ||
                              input.endsWith('*') ||
                              input.startsWith('*')) {
                            null;
                          } else {
                            //flutter pub add math_expressions
                            Parser p = Parser();
                            Expression exp = p.parse(input);
                            var eval = exp.evaluate(
                                EvaluationType.REAL, ContextModel());
                            setState(() {
                              output = eval.toString();
                            });
                            // if (eval == 'Infinity') {
                            //   output = eval.toString();
                            // } else {
                            //   setState(() {
                            //     if (eval % eval.floor() == 0) {
                            //       output = eval.toInt().toString();
                            //     } else {
                            //       output = eval.toString();
                            //     }
                            //   });
                            // }
                          }
                        } else if (symbols[index] == 'Ans') {
                          setState(() {
                            output = input;
                            input = '';
                          });
                        } else if (symbols[index] == '+' ||
                            symbols[index] == '-' ||
                            symbols[index] == '%' ||
                            symbols[index] == '/' ||
                            symbols[index] == '*') {
                          if (input == ' ' ||
                              input == '' ||
                              input.endsWith('+') ||
                              input.startsWith('+') ||
                              input.endsWith('-') ||
                              input.startsWith('-') ||
                              input.endsWith('/') ||
                              input.startsWith('/') ||
                              input.endsWith('%') ||
                              input.startsWith('%') ||
                              input.endsWith('*') ||
                              input.startsWith('*')) {
                            null;
                          } else {
                            setState(() {
                              input += symbols[index];
                            });
                          }
                        } else {
                          setState(() {
                            input = input + symbols[index];
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          color: setColor(
                            symbols[index],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          symbols[index],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

///FUNCTION for Set Color For Bottom
///Color setColor(String x)

Color setColor(String x) {
  if (x == '=' || x == '-' || x == '+' || x == '*' || x == '/') {
    return Colors.amber;
  } else if (x == 'C' || x == 'Del' || x == '%') {
    return Colors.grey;
  } else {
    return Colors.grey.withOpacity(.2);
  }
}
