import 'package:flutter/material.dart';

Widget buildContainer(IconData icons,String s1,String s2) {

  if(icons == Icons.arrow_downward){
    return Container(
      width: 100,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icons,color: Colors.red,),
          Text("$s1",style: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          Text("$s2",style: TextStyle(
              fontSize: 14,
              color: Colors.grey
          ),),
        ],
      ),
    );
  }
  if(icons == Icons.arrow_upward){
    return Container(
      width: 100,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icons,color: Colors.green,),
          Text("$s1",style: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          Text("$s2",style: TextStyle(
              fontSize: 14,
              letterSpacing: 1,
              color: Colors.grey
          ),),
        ],
      ),
    );
  }

}

Widget buildCard(String s1, String s2,String s3) {
  return Card(
      child: Container(
          color: Colors.white,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(s1,style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),),
                  Text(s2,style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                  Text(s3,style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  ),),
                ],
              )
          )
      )
  );
}