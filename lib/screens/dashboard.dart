import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:webapp/app_config.dart'as config;
import 'package:webapp/component/widgetcomponent.dart';
import 'package:webapp/model/chart_model.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),

    const StaggeredTile.count(4, 3),
    const StaggeredTile.count(4, 3),

    const StaggeredTile.count(3, 2),
    const StaggeredTile.count(5, 3),
  ];

  List<StaggeredTile> _staggeredTiles1000 = const <StaggeredTile>[
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),

    const StaggeredTile.count(8, 6),
    const StaggeredTile.count(8, 6),

    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(5, 3),
  ];

  List<StaggeredTile> _staggeredTiles750 = const <StaggeredTile>[
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(4, 2),

    const StaggeredTile.count(8, 6),
    const StaggeredTile.count(8, 6),

    const StaggeredTile.count(8, 8),
    const StaggeredTile.count(8, 8),
  ];


  List<StaggeredTile> _staggeredTiles1 = const <StaggeredTile>[
    const StaggeredTile.count(8, 4),
    const StaggeredTile.count(8, 4),
    const StaggeredTile.count(8, 4),
    const StaggeredTile.count(8, 4),

    const StaggeredTile.count(8, 8),
    const StaggeredTile.count(8, 8),

    const StaggeredTile.count(8, 6),
    const StaggeredTile.count(8, 8),
  ];



  @override
  Widget build(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(this.context);


    //-----Chart setup------
    var data = [
      ClicksPerYear('2013', 12, Colors.blue),
      ClicksPerYear('2014', 42, Colors.teal),
      ClicksPerYear('2015', 30, Colors.green),
      ClicksPerYear('2016', 12, Colors.red),
      ClicksPerYear('2017', 42, Colors.yellow),
      ClicksPerYear('2018', 30, Colors.green),
      ClicksPerYear('2019', 12, Colors.grey),
      ClicksPerYear('2020', 12, Colors.purple),
      ClicksPerYear('2021', 12, Colors.red),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    //------ chart widget---------------
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: config.App(context).appHeight(30),
        child: chart,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth > 1128){
            return Stack(
              alignment:Alignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color:Color(0xffFD564F),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                StaggeredGridView.count(
                  padding: EdgeInsets.only(top: 100,left: 16,right: 16),
                  crossAxisCount: 8,
                  staggeredTiles:_staggeredTiles,
                  children: [
                    //-------first row-----
                    buildCard("Total Subscription","8952","48% From Last 24 Hours"),
                    buildCard("Order Status","8952","48% From Last 24 Hours"),
                    buildCard("Unique Visitors","8952","48% From Last 24 Hours"),
                    buildCard("Monthly Earnings","8952","48% From Last 24 Hours"),

                    //-------second row-----
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                    child: new Text(
                                      'Revenue',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildContainer(Icons.arrow_upward,"5248","MarketPlace"),
                                      buildContainer(Icons.arrow_downward,"503","Last Week"),
                                      buildContainer(Icons.arrow_downward,"102","Last Month")
                                    ],
                                  ),
                                  chartWidget,
                                ],
                              ),
                            )
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                    child: new Text(
                                      'Email Sent',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildContainer(Icons.arrow_upward,"3654","MarketPlace"),
                                      buildContainer(Icons.arrow_downward,"954","Last Week"),
                                      buildContainer(Icons.arrow_downward,"102","Last Month")
                                    ],
                                  ),
                                  chartWidget,
                                ],
                              ),
                            )
                        )
                    ),

                    //-------third row-----
                    Card(
                        elevation: 0.0,
                        child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: ListView(
                              children: [
                                Text("Goal Completion",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                                SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Add Product to cart",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Visit Premium plan",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width:_queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.3,
                                  trailing:Text(
                                    "30.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Complete Purchases",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width:_queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.7,
                                  trailing:Text(
                                    "70.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),
                              ],
                            )
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                DataTable(

                                  columns: [
                                    DataColumn(label: Text('Name')),
                                    DataColumn(label: Text('Position')),
                                    DataColumn(label: Text('Office')),
                                    DataColumn(label: Text('Age')),
                                    DataColumn(label: Text('Start date')),
                                    DataColumn(label: Text('Salary')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                  ],
                                ),
                              ],
                            )
                        )
                    ),

                  ],
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              ],
            );
          } else if(constraints.minWidth < 1128){
            return Stack(
              alignment:Alignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color:Color(0xffFD564F),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                StaggeredGridView.count(
                  padding: EdgeInsets.only(top: 100,left: 16,right: 16),
                  crossAxisCount: 8,
                  staggeredTiles:_staggeredTiles750,
                  children: [
                    //-------first row-----
                    buildCard("Total Subscription","8952","48% From Last 24 Hours"),
                    buildCard("Order Status","8952","48% From Last 24 Hours"),
                    buildCard("Unique Visitors","8952","48% From Last 24 Hours"),
                    buildCard("Monthly Earnings","8952","48% From Last 24 Hours"),

                    //-------second row-----
                    Card(
                        elevation: 0.0,
                        child: ListView(
                          children: [
                            Container(
                                color: Colors.white,
                                child: Center(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                        child: new Text(
                                          'Revenue',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                        ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildContainer(Icons.arrow_upward,"5248","MarketPlace"),
                                          buildContainer(Icons.arrow_downward,"503","Last Week"),
                                          buildContainer(Icons.arrow_downward,"102","Last Month")
                                        ],
                                      ),
                                      chartWidget,
                                    ],
                                  ),
                                )
                            ),
                          ],
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: ListView(
                          children: [
                            Container(
                                color: Colors.white,
                                child: Center(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                        child: new Text(
                                          'Email Sent',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                        ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildContainer(Icons.arrow_upward,"3654","MarketPlace"),
                                          buildContainer(Icons.arrow_downward,"954","Last Week"),
                                          buildContainer(Icons.arrow_downward,"102","Last Month")
                                        ],
                                      ),
                                      chartWidget,
                                    ],
                                  ),
                                )
                            ),
                          ],
                        )
                    ),

                    //-------third row-----
                    Card(
                        elevation: 0.0,
                        child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: ListView(
                              children: [
                                Text("Goal Completion",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                                SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Add Product to cart",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width:  config.App(context).appWidth(70),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Visit Premium plan",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: config.App(context).appWidth(70),
                                  lineHeight: 14.0,
                                  percent: 0.3,
                                  trailing:Text(
                                    "30.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Complete Purchases",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: config.App(context).appWidth(70),
                                  lineHeight: 14.0,
                                  percent: 0.7,
                                  trailing:Text(
                                    "70.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: config.App(context).appWidth(70),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: config.App(context).appWidth(70),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),
                              ],
                            )
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                DataTable(

                                  columns: [
                                    DataColumn(label: Text('Name')),
                                    DataColumn(label: Text('Position')),
                                    DataColumn(label: Text('Office')),
                                    DataColumn(label: Text('Age')),
                                    DataColumn(label: Text('Start date')),
                                    DataColumn(label: Text('Salary')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                  ],
                                ),
                              ],
                            )
                        )
                    ),

                  ],
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              ],
            );
          } else{
            return Stack(
              alignment:Alignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color:Color(0xffFD564F),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                StaggeredGridView.count(
                  padding: EdgeInsets.only(top: 100,left: 16,right: 16),
                  crossAxisCount: 8,
                  staggeredTiles:_staggeredTiles1000,
                  children: [
                    //-------first row-----
                    buildCard("Total Subscription","8952","48% From Last 24 Hours"),
                    buildCard("Order Status","8952","48% From Last 24 Hours"),
                    buildCard("Unique Visitors","8952","48% From Last 24 Hours"),
                    buildCard("Monthly Earnings","8952","48% From Last 24 Hours"),

                    //-------second row-----
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                    child: new Text(
                                      'Revenue',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildContainer(Icons.arrow_upward,"5248","MarketPlace"),
                                      buildContainer(Icons.arrow_downward,"503","Last Week"),
                                      buildContainer(Icons.arrow_downward,"102","Last Month")
                                    ],
                                  ),
                                  chartWidget,
                                ],
                              ),
                            )
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24,right: 24,top: 16),
                                    child: new Text(
                                      'Email Sent',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildContainer(Icons.arrow_upward,"3654","MarketPlace"),
                                      buildContainer(Icons.arrow_downward,"954","Last Week"),
                                      buildContainer(Icons.arrow_downward,"102","Last Month")
                                    ],
                                  ),
                                  chartWidget,
                                ],
                              ),
                            )
                        )
                    ),

                    //-------third row-----
                    Card(
                        elevation: 0.0,
                        child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: ListView(
                              children: [
                                Text("Goal Completion",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                                SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Add Product to cart",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Visit Premium plan",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width:_queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.3,
                                  trailing:Text(
                                    "30.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Complete Purchases",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width:_queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.7,
                                  trailing:Text(
                                    "70.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),

                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text("Send Inquiries",style: TextStyle(color:Colors.black),),
                                ),
                                SizedBox(height: 5,),
                                LinearPercentIndicator(
                                  width: _queryData.size.width == 500 ? config.App(context).appWidth(70) : config.App(context).appWidth(25),
                                  lineHeight: 14.0,
                                  percent: 0.5,
                                  trailing:Text(
                                    "50.0%",
                                    style: new TextStyle(fontSize: 12.0,color: Colors.green,fontWeight: FontWeight.bold),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.lightGreen,
                                  progressColor: Colors.green,
                                ),
                              ],
                            )
                        )
                    ),
                    Card(
                        elevation: 0.0,
                        child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                DataTable(

                                  columns: [
                                    DataColumn(label: Text('Name')),
                                    DataColumn(label: Text('Position')),
                                    DataColumn(label: Text('Office')),
                                    DataColumn(label: Text('Age')),
                                    DataColumn(label: Text('Start date')),
                                    DataColumn(label: Text('Salary')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Tiger Nixon')),
                                      DataCell(Text('System Architect')),
                                      DataCell(Text('Edinburgh')),
                                      DataCell(Text('61')),
                                      DataCell(Text('2011/04/25')),
                                      DataCell(Text('320,800')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(icon: Icon(Icons.edit,color: Colors.green,)),
                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,)),
                                          IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                        ],
                                      )),
                                    ]),
                                  ],
                                ),
                              ],
                            )
                        )
                    ),

                  ],
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              ],
            );
          }
        },

      ),
    );
  }
}
