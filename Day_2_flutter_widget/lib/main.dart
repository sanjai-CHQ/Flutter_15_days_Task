import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false ,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Task'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _containerExamples(),

            SizedBox(height: 20),

            _rowExamples(),

            SizedBox(height: 20),

            _columnExamples(),

            SizedBox(height: 20),

            _stackExamples(),

            SizedBox(height: 20),

            _textExamples(),

            SizedBox(height: 20),
          ]
        )
      )
    );
  }
  //container examples

  Widget _containerExamples() {
    return Column(
      children: [
        Container(
        width:200,
        height: 100,
        color: Colors.blue[100],
        padding: EdgeInsets.all(20),
        child: Text('Basic Container'),
      ),
      SizedBox(height: 10,),

      Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        padding: EdgeInsets.all(20),
        child: Text('Decorated Container'),
      ),
      SizedBox(height: 20),

      Container(
        width: 200,
        height: 100,
        color: Colors.red[100],
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text('Container with Margin'),
      )
      ],
    );
  }

//row examples
  Widget _rowExamples(){
    return Column(
      children:[
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[100],
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width:5),
              Text('Basic Row'),
              SizedBox(width:5),
              Icon(Icons.favorite, color: Colors.red,),
          ],
          ),
        ),
        SizedBox(height: 10,),

        Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 50, height: 50, color: Colors.red,),
              Container(width: 50, height: 50, color: Colors.yellow,),
              Container(width: 50, height: 50, color: Colors.green,),
            ],
          )
        ),
        SizedBox(height: 10,),

        Container(
          height: 100,
          padding: EdgeInsets.all(10),
          color: Colors.blue[50],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 50, height: 50, color: Colors.purple,),
              Container(width: 50, height: 50, color: Colors.orange,),
              Container(width: 50, height: 50, color: Colors.pink,),
            ],
          )
        )
      ]
    );
  }

//column examples
Widget _columnExamples(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 100,
        padding: EdgeInsets.all(8),
        color: Colors.grey[100],
        child: Column(
          children: [
            Icon(Icons.home),
            SizedBox(height: 5,),
            Text('Home'),
            SizedBox(height: 5),
            Icon(Icons.settings),
          ]),
      ),
      
      Container(
        width: 100,
        height: 200,
        padding: EdgeInsets.all(10),
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 30, height: 30, color: Colors.red),
            Container(width: 30, height: 30, color: Colors.green),
            Container(width: 30, height: 30, color: Colors.blue),
          ]),
      ),
      
       Container(
          width: 200,
          padding: EdgeInsets.all(10),
          color: Colors.green[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 60, height: 20, color: Colors.purple),
              SizedBox(height: 5),
              Container(width: 40, height: 20, color: Colors.orange),
              SizedBox(height: 5),
              Container(width: 80, height: 20, color: Colors.pink),
            ],
          ),
       ),
    ],
  );
}

//Stack Examples
Widget _stackExamples(){
  return Container(
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),

              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.red,
                ),
              ),

              Positioned(
                bottom: 10,
                right: 10,
                child: Icon(Icons.star, color: Colors.yellow, size: 30),
              ),
          ],
        ),

         Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                '99+',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
      ],
    ),
  );
}

//text example
Widget _textExamples(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Default Text'),
        Text(
          'Bold Text',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
           Text(
          'Colored Text',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        Text(
          'Styled Text with Multiple Properties',
          style: TextStyle(
            fontSize: 16,
            color: Colors.purple,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            decoration: TextDecoration.underline,
          ),
        ),
    ],
  );
}

}