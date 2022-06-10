import 'package:flutter/material.dart';
import 'package:neumorphic_button/neu_button_4.dart';

import 'neu_button_2.dart';
import 'neu_button_1.dart';
import 'neu_button_3.dart';
import 'neu_button_using_package.dart';
import 'neu_round_button_1.dart';
import 'neu_round_button_2.dart';

void main() => runApp(const NeumorphicApp());

class NeumorphicApp extends StatelessWidget {
  const NeumorphicApp({Key? key}) : super(key: key);

  final List<Tab> myTabs = const [
    Tab(text: 'TYPE1'),
    Tab(text: 'TYPE2'),
    Tab(text: 'TYPE3'),
    Tab(text: 'TYPE4'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(indicatorColor: Colors.white, tabs: myTabs),
            title: const Text('NEUMORPHIC BUTTONS'),
            backgroundColor: Colors.teal,
            centerTitle: true,
          ),
          backgroundColor: Colors.blueGrey.shade200,
          body: TabBarView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              const NeuButton1(child: Text('Button 1')),
              const SizedBox(height: 30),
              NeuButton2(child: const Text('Button 2')),
              const SizedBox(height: 50),
              NeuButton3(
                child: const Center(
                  child: Text(
                    'Button 3',
                    style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ]),
            const NeuButton4(),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
              SizedBox(height: 50),
              NeuRoundButton1(child: SizedBox(height: 100, width: 100)),
              SizedBox(height: 50),
              NeuRoundButton2(child: SizedBox(height: 100, width: 100)),
              SizedBox(height: 50),
            ]),
            NeuButtonUsingPackage(),
          ]),
        ),
      ),
    );
  }
}
