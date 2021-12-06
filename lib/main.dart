import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/services/dio_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onPressedValue = true;
  DioClient _dio = DioClient();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CryptoCurrency',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade900),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Current Crypto Markets',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w700),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              child: FutureBuilder<List<String>>(
                  future: _dio.getBitCoinValue(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<String> data = snapshot.data ?? [];
                      if (snapshot.data != null) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(16.0),
                                            child: Text(
                                              data[index],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      }
                      return Text("Invalid");
                    }
                  }),
            )),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade800,
                      minimumSize: Size(200, 60)),
                  onPressed: onPressedValue == true
                      ? () {
                          setState(() {
                            onPressedValue = false;
                          });

                          print("PRESSED");
                          Timer(Duration(seconds: 15), () {
                            setState(() {
                              onPressedValue = true;
                            });
                          });
                        }
                      : null,
                  child: Text('Refresh Data')),
            ),
          ],
        ),
      ),
    );
  }
}
