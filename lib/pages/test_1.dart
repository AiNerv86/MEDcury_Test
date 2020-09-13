import 'package:flutter/material.dart';

class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {
  String inputString, newString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test 1'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildInputTextField(),
            SizedBox(
              height: 16.0,
            ),
            buildResult(),
            SizedBox(
              height: 16.0,
            ),
            buildDecodeButton()
          ],
        ),
      ),
    );
  }

  Widget buildDecodeButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: RaisedButton(
        onPressed: () {
          newString = inputString
              .replaceAll(new RegExp(r"WUB"), ' ')
              .split(' ')
              .toSet()
              .join(' ')
              .trim();

          print(newString);

          setState(() {
            inputString = newString.split('  ').toSet().join(' ');
          });
        },
        child: Text('DECODER'),
      ),
    );
  }

  Widget buildInputTextField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Scrollbar(
        child: TextField(
          onChanged: (value) => inputString = value.trim(),
          autofocus: true,
          maxLines: 4,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration.collapsed(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey.shade500,
              ),
            ),
            hintText: "type here please",
            hintStyle: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }

  Widget buildResult() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade500,
        ),
      ),
      child: Center(
        child: inputString == null
            ? Text('')
            : Text(
                inputString,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
      ),
    );
  }
}
