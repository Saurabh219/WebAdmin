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
    elevation: 10.0,
      shadowColor: Colors.grey,
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



class LoginButton extends StatelessWidget {
  MediaQueryData queryData;
  LoginButton({this.btntext,this.click});
  Function click;
  final btntext;
  @override
  Widget build(BuildContext context) {
    queryData= MediaQuery.of(context);
    return Container(
      width: queryData.size.width/1,
      padding: EdgeInsets.only(left: 8,right: 8),
      decoration: BoxDecoration(
          color: Color(0xffFD564F),
          borderRadius:BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(10),
          )
      ),
      child: FlatButton(
        onPressed: click,
        color: Colors.transparent,
        child: Text(btntext,style: TextStyle(
            color: Colors.white
        ),),
      ),
    );
  }
}