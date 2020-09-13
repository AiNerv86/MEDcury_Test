import 'package:flutter/material.dart';
import 'package:medcurytest/pages/test_1.dart';
import 'package:medcurytest/pages/test_2.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDcury TEST'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTest1Button(context),
            SizedBox(
              height: 16.0,
            ),
            buildTest2Button(context),
          ],
        ),
      ),
    );
  }

  Container buildTest2Button(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      child: RaisedButton(
        onPressed: () => routeToService(Test2Page()),
        child: Text('TEST 2'),
      ),
    );
  }

  Container buildTest1Button(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      child: RaisedButton(
        onPressed: () => routeToService(Test1Page()),
        child: Text('TEST 1'),
      ),
    );
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.push(context, route);
  }
}
