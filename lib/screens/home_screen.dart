import 'package:flutter/material.dart';
import 'package:webapp/screens/dashboard.dart';



class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("Product", Icons.insert_chart),
    new DrawerItem("Users", Icons.supervised_user_circle)
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedDrawerIndex = 0;

  var title= "DashBoard";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:

        return new DashBoard();
      case 1:

        return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset("images/underdevelopment.png",width: 500,),Text("Under Development")],));
      case 2:

        return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset("images/worktogether.png",width: 500,),Text("Under Development")],));

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {

    switch(index){
      case 0:
        setState(() {
          title = "DashBoard";
        });
        break;
      case 1:
        setState(() {
          title = "Products";
        });
        break;
      case 2:
        setState(() {
          title = "Users";
        });
        break;
    }

    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop(); // close the drawer
  }


  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Text(title),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundColor: Colors.white10,child: Icon(Icons.notifications_active,color: Colors.white,size: 20,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundColor: Colors.white10,child: Icon(Icons.search,color: Colors.white,size: 20,)),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.white10,child: Icon(Icons.people,color: Colors.white,size: 20,)),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Saurabh MOurya",style: TextStyle(
                            fontSize: 14
                        ),),
                        Text("Flutter Developer",style: TextStyle(
                            fontSize: 10
                        ),),
                      ],
                    ),
                  ),
                ],
              )
            )
          ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName:   Text("John Doe",style: TextStyle(color: Colors.black),),
                accountEmail:  Text("JohnDoe@gmail.com",style: TextStyle(color: Colors.grey),),
               currentAccountPicture: Image.asset("images/avtar.png"),
               decoration: BoxDecoration(
                color: Colors.white
              )
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),

      body: _getDrawerItemWidget(_selectedDrawerIndex),

    );
  }


}


