import 'package:flutter/material.dart';

class Test2Page extends StatefulWidget {
  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  List nameArr = List();
  List addressArr = List();
  List phoneNumArr = List();

  String categoryString, valueString, resultString;

  String dr = "/+1-541-754-3010 156 Alphand_St. <J Steeve>\n" +
      "133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010\n" +
      "+1-541-984-3012 <P Reed> /PO Box 530; Pollocksville, NC-28573\n" +
      ":+1-321-512-2222 <Paul Dive> Sequoia Alley PQ-67209\n" +
      "+1-741-984-3090 <Peter Reedgrave> _Chicago\n" +
      ":+1-921-333-2222 <Anna Stevens> Haramburu_Street AA-67209\n" +
      "+1-111-544-8973 <Peter Pan> LA\n" +
      "+1-921-512-2222 <Wilfrid Stevens> Wild Street AA-67209\n" +
      "<Peter Gone> LA ?+1-121-544-8974 \n" +
      "<R Steell> Quora Street AB-47209 +1-481-512-2222\n" +
      "<Arthur Clarke> San Antonio +1-121-504-8974 TT-45120\n" +
      "<Ray Chandler> Teliman Pk. !+1-681-512-2222! AB-47209,\n" +
      "<Sophia Loren> +1-421-674-8974 Bern TP-46017\n" +
      "<Peter O'Brien> High Street +1-908-512-2222; CC-47209\n" +
      "<Anastasia> +48-421-674-8974 Via Quirinal Roma\n " +
      "<P Salinger> Main Street, +1-098-512-2222, Denver\n" +
      "<C Powel> *+19-421-674-8974 Chateau des Fosses Strasbourg F-68000\n" +
      "<Bernard Deltheil> +1-498-512-2222; Mount Av. Eldorado\n" +
      "+1-099-500-8000 <Peter Crush> Labrador Bd.\n" +
      "+1-931-512-4855 <William Saurin> Bison Street CQ-23071\n" +
      "<P Salinge> Main Street, +1-098-512-2222, Denve\n";

  @override
  void initState() {
    super.initState();

    prepareContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test 2'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildCategoryTextField(),
            SizedBox(
              height: 8.0,
            ),
            buildValueTextField(),
            SizedBox(
              height: 16.0,
            ),
            Text('result'),
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

  Widget buildCategoryTextField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Scrollbar(
        child: TextField(
          onChanged: (value) => categoryString = value.trim(),
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration.collapsed(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey.shade500,
              ),
            ),
            hintText: "Type Category here",
            hintStyle: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }

  Widget buildValueTextField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Scrollbar(
        child: TextField(
          onChanged: (value) => valueString = value.trim(),
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration.collapsed(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey.shade500,
              ),
            ),
            hintText: "Type Value here",
            hintStyle: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }

  Widget buildResult() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade500,
        ),
      ),
      child: Center(
        child: resultString == null
            ? Text('')
            : SingleChildScrollView(
                child: Text(
                  resultString,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildDecodeButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: RaisedButton(
        onPressed: () => decodeThred(),
        child: Text('DECODER'),
      ),
    );
  }

  void decodeThred() {
    List focusArray;

    switch (categoryString.trim().toLowerCase()) {
      case "phone":
        focusArray = phoneNumArr;

        break;
      case "name":
        focusArray = nameArr;

        break;
      case "address":
        focusArray = addressArr;

        break;
      default:
    }
    // print(valueString);
    // print(focusArray);

    for (var i = 0; i < focusArray.length; i++) {
      if (focusArray[i].toString().toLowerCase().trim() ==
          valueString.toLowerCase().trim()) {
        print(focusArray[i].toString().toLowerCase().trim());
        print(valueString.toLowerCase().trim());

        setState(() {
          resultString =
              "Name => ${nameArr[i].toString()}\nPhone => ${phoneNumArr[i].toString()}\nAddress => ${addressArr[i].toString()}";
        });
        break;
      } else {
        print('Error');
        setState(() {
          resultString = "Error => Not found: $valueString";
        });
        break;
      }
    }
  }

  void prepareContent() {
    List contentArr = List();

    contentArr = dr.toString().split("\n");
    contentArr.removeLast();

    List tempArr = List();

    int indexStartPhone, indexEndPhone, indexStartName, indexEndName;

    String tempAddress;

    for (var item in contentArr) {
      tempArr = item.toString().split("");

      for (var i = 0; i < tempArr.length; i++) {
        if (tempArr[i] == "+" && tempArr[i + 2] == "-") {
          phoneNumArr.add(item.toString().substring(i, i + 15));

          indexStartPhone = i;
          indexEndPhone = i + 15;
        } else if (tempArr[i] == "+" && tempArr[i + 3] == "-") {
          if ((i + 16) >= tempArr.length - 1) {
            phoneNumArr.add(item.toString().substring(i, tempArr.length - 1));
          } else {
            phoneNumArr.add(item.toString().substring(i, i + 16));
          }

          indexStartPhone = i;
          indexEndPhone = i + 16;
        }

        if (tempArr[i] == "<") {
          indexStartName = i;
        }

        if (tempArr[i] == ">") {
          indexEndName = i;
        }

        if (i == tempArr.length - 1) {
          if (indexStartPhone > indexEndName) {
            //phone content is right
            // print(
            //     'indexStartName:$indexStartName, indexEndName:$indexEndName, indexStartPhone:$indexStartPhone, indexEndPhone:$indexEndPhone');

            if (indexStartName >= 0) {
              if (indexEndPhone < i) {
                tempAddress = item.toString().substring(0, indexStartName) +
                    item
                        .toString()
                        .substring(indexEndName + 1, indexStartPhone - 1) +
                    item.toString().substring(indexEndPhone + 1, i + 1);
              } else {
                tempAddress = item.toString().substring(0, indexStartName) +
                    item
                        .toString()
                        .substring(indexEndName + 1, indexStartPhone - 1);
              }

              //print(tempAddress);
            }
          } else {
            //phone content is left
            // print(
            //     'indexStartPhone:$indexStartPhone, indexEndPhone:$indexEndPhone, indexStartName:$indexStartName, indexEndName:$indexEndName');

            if (indexStartPhone == 0 || indexStartPhone == 1) {
              if (indexEndName < i) {
                //print('have data left');

                if ((indexEndPhone + 1) - (indexStartName - 1) == 1) {
                  tempAddress =
                      item.toString().substring(indexEndName + 1, i + 1);
                } else {
                  tempAddress = item
                      .toString()
                      .substring(indexEndPhone + 1, indexStartName - 1);
                }
              } else {
                tempAddress = item
                    .toString()
                    .substring(indexEndPhone + 1, indexStartName - 1);
              }
            } else {
              tempAddress = item.toString().substring(0, indexStartPhone - 1);
            }

            //print(tempAddress);
          }

          //print(tempAddress.trim());
          addressArr.add(tempAddress.trim());

          //print(item.toString().substring(indexStartName + 1, indexEndName));

          nameArr
              .add(item.toString().substring(indexStartName + 1, indexEndName));
        }
      }
    }

    // print('phoneContentArr::$phoneNumArr');

    // print('nameArr::$nameArr');

    // print('addressArr::$addressArr');
  }
}
