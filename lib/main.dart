// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Money Management',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => Home(),
      },
    ),
  );
}

class Sales {
  final String day;
  final int money;

  Sales(this.day, this.money);
}

var income = [
  Sales("Mn", 50),
  Sales("Te", 70),
  Sales("wd", 100),
  Sales("Tu", 150),
  Sales("Fr", 250),
  Sales("St", 18),
  Sales("Sn", 30),
];
var spend = [
  Sales("Mn", 50),
  Sales("Te", 70),
  Sales("wd", 100),
  Sales("Tu", 150),
  Sales("Fr", 250),
  Sales("St", 18),
  Sales("Sn", 30),
];

var series = [
  charts.Series(
    domainFn: (Sales sales, _) => sales.day,
    measureFn: (Sales sales, _) => sales.money,
    id: 'Sales',
    data: income,
  ),
  charts.Series(
    domainFn: (Sales sales, _) => sales.day,
    measureFn: (Sales sales, _) => sales.money,
    id: 'Sales',
    data: spend,
  )
];

var chart = charts.BarChart(
  series,
  vertical: true,
  barGroupingType: charts.BarGroupingType.grouped,
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 50.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selamat Malam,",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Marsha Audria",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardTerkini(
                    image: 'assets/images/mastercard.png',
                    name_holder: "Kevin",
                    number_va: "2020102754121",
                    exp: '03-01-2023',
                  ),
                  CardTerkini(
                    image: 'assets/images/mastercard.png',
                    name_holder: "Marsha",
                    number_va: "202010275412",
                    exp: '03-01-2025',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Income'), Text('Rp.20000')],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Spend'), Text('Rp.10000')],
                        ),
                      ],
                    ),
                    SizedBox(height: 400.0, child: chart),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class CardTerkini extends StatelessWidget {
  CardTerkini({this.name_holder, this.exp, this.number_va, this.image});
  final String name_holder;
  final String number_va;
  final String exp;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color(0xff1E1E99),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            image,
                            height: 45.0,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CARD NUMBER',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            number_va,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CARD HOLDERNAME',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    name_holder,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'EXPIRY DATE',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    exp,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
