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

            _flexExamples(),

            SizedBox(height: 20),

            _expandedExamples(),

            SizedBox(height: 20),

            _flexibleExamples(),

            SizedBox(height: 20),

            _wrapExamples(),

            SizedBox(height: 20),

            _listViewExamples(),

            SizedBox(height: 20),

            _alignmentExamples(),

            SizedBox(height: 20),

            _gradientExamples(),

            SizedBox(height: 20),

            _borderExamples(),

            SizedBox(height: 20),

            _boxDecorationExamples(),

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

//flex examples
Widget _flexExamples(){
  return Container(
    height: 100,
    child: Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            child: Center(child: Text('1'),),),
        ),

          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green, 
              child: Center(child: Text('2'))),
          ),

            Expanded(
            flex: 1,
            child: Container(color: Colors.blue, child: Center(child: Text('1'))),
          ),
      ],
    ),
  );
}

//expanded examples
Widget _expandedExamples() {
    return Container(
      height: 80,
      child: Row(
        children: [
          Container(
            width: 50,
            color: Colors.red,
            child: Center(child: Text('Fixed')),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Center(child: Text('Expanded')),
            ),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Center(child: Text('Fixed')),
          ),
        ],
      ),
    );
  }

//flexible examples
Widget _flexibleExamples() {
    return Container(
      height: 80,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.orange,
              child: Center(child: Text('Flex 1')),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.purple,
              child: Center(child: Text('Flex 2')),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.cyan,
              child: Center(child: Text('Flex 1')),
            ),
          ),
        ],
      ),
    );
  }

//wrap example
Widget _wrapExamples(){
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.grey[100],
    child: Wrap(
      spacing:10,
      runSpacing: 10,
      children: [
        Container(width: 80, height: 40, color: Colors.red, child: Center(child: Text('1')),),
        Container(width: 100, height: 40, color: Colors.green, child: Center(child: Text('2'))),
        Container(width: 90, height: 40, color: Colors.blue, child: Center(child: Text('3'))),
        Container(width: 70, height: 40, color: Colors.orange, child: Center(child: Text('4'))),
        Container(width: 110, height: 40, color: Colors.purple, child: Center(child: Text('5'))),
        Container(width: 85, height: 40, color: Colors.teal, child: Center(child: Text('6'))),
      ],
    )
  );
}

//listview example
Widget _listViewExamples(){
  return Container(
    height: 200,
    child: ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Sanjai'),
          subtitle: Text('Tirupur'),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Kishore'),
          subtitle: Text('Kangipurum'),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Nihill'),
          subtitle: Text('Coimbatore'),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Dhinesh'),
          subtitle: Text('Tirupur'),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    ),
  );
}

//alignment examples
Widget _alignmentExamples() {
    return Container(
      color: Colors.grey,
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CrossAxis.start'),
                Container(height: 30, width: 60, color: Colors.red),
                Container(height: 30, width: 40, color: Colors.green),
                Container(height: 30, width: 80, color: Colors.blue),
              ],
            ),
          ),
          // MainAxisAlignment example
          Expanded(
            child: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('MainAxis.spaceEvenly'),
                  Container(height: 20, width: 60, color: Colors.orange),
                  Container(height: 20, width: 60, color: Colors.purple),
                  Container(height: 20, width: 60, color: Colors.cyan),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//gradinet examples
Widget _gradientExamples(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: Text('Linear', style: TextStyle(color: Colors.white),)),
      ),

      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.orange, Colors.purple],
          ),
        ),
        child: Center(child: Text('Radial', style: TextStyle(color: Colors.white),)),
      )
    ],
  );
}

//border examples
Widget _borderExamples(){
  return Wrap(
    spacing: 15,
    runSpacing: 15,
    children: [
      Container(
        width:80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(child: Text('Border'),),
      ),

      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue[100],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text('Rounded')),
      ),

      Container(
         width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(color: Colors.green, width: 3),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text('Circle')),
      )
    ],
  );
}

//boxdecoration examples
Widget _boxDecorationExamples() {
  return Wrap(
    spacing: 15,
    runSpacing: 15,
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
            ],
            ),
            child: Center(child: Text('Shadow')),
      ),

      Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.orange],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Center(
            child: Text('Complex', style: TextStyle(color: Colors.white)),
          ),
        ),
    ],
  );
}

}