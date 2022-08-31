import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//enum Selectcolor{UNDERwight,}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String t = "";
  String h = "";
  String w = "";
  double bmi = 0.0;
  bool isTapped = false;

  void setmethod() {
    setState(() {
      var hight = double.parse(h);
      var weight = double.parse(w);
      double ph = hight / 100;
      bmi = weight / (ph * ph);
      String s = "";

      if (hight < 30) {
        s = "YOU  CAN'NT SELECT HIGHT LESS THEN 30cm";
      } else if (weight < 3) {
        s = "YOU CAN'NT SELECT WEIGHT UNDER 3KG ";
      } else if (25.0 < bmi && bmi < 30.0) {
        s = "You are OVER WEIGHT";
      } else if (bmi < 18.5) {
        s = "UNDER WEIGHT";
      } else if (bmi > 18.49 && bmi < 25.0) {
        s = "Perfect WEIGHT";
      } else if (bmi > 30.0) {
        s = " YOU ARE IN DANGER RANGE";
      }

      t = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: const AssetImage("assets/mark.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter Your Hight",
                              hintText: "Enter Hight in Centimeter"),
                          onChanged: ((value) => h = value),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter Your Weight",
                              hintText: "Weight in kg"),
                          onChanged: ((value) => w = value),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                        ),
                        InkWell(
                          onTap: () {
                            isTapped = !isTapped;

                            if (_formKey.currentState!.validate()) {
                              setmethod();
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.lightGreen),
                              width: 200,
                              height: 50,
                              child: const Center(
                                  child: Text(
                                'Check',
                                textScaleFactor: 2,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                        ),
                        Visibility(
                            visible: isTapped,
                            child: Container(
                              constraints: BoxConstraints.expand(
                                height: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .fontSize! *
                                        1.1 +
                                    200.0,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              color: bmi < 18.5
                                  ? Colors.orange
                                  : (bmi > 18.4 && bmi < 25.0)
                                      ? Colors.lightGreen
                                      : (bmi > 24.99 && bmi < 30.0)
                                          ? Colors.redAccent
                                          : bmi > 30
                                              ? Colors.red
                                              : null,
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(0),
                              child: Text(
                                t,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: const Color(0xff00fbac)),
                              ),
                            ))
                      ],
                    ),
                  ),
                ])));
  }
}
