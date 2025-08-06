import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter day 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter states'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StatelessWidgetExamples(),),
          ),
          child: Text('Stateless Widget Examples'),
          ),
          SizedBox(height: 10,),

          ElevatedButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StatefullWidgetExamples(),)
          ),
          child: Text('Statefull Widget Examples'),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class StatelessWidgetExamples extends StatelessWidget {
  const StatelessWidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Examples'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stateless Widget Examples', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),

            CustomCard(
              title: 'Welcome to Command HQ',
              subtitle: 'vetnet Social',
              icon: Icons.star,
              color: Colors.blue,
            ),
            SizedBox(height: 10,),


            profileWidget(
              name: 'Sanjai',
              email: 'sanjai.s77777@gmail.com',
              avatarUrl: 'assets\images\21BAD051 photo.jpg',
            ),
            SizedBox(height: 10,),

            InfoBadge(
              label: 'New Feature',
              count: 5,
              badgeColor: Colors.red,
            ),
            SizedBox(height: 20),

            Text('Widget Composition Example:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ComposeWidget(),
            SizedBox(height: 20,),

            Text('Stateless Form Comomponents:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            StatelessFormExample(),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const CustomCard({Key? key,
  required this.title,
  required this.subtitle,
  required this.icon,
  required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30,),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(subtitle, style: TextStyle(color: Colors.grey[600]),)
              ],
            )
        ]),
      ),
    );
  }
}

class profileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  const profileWidget({Key? key,
  required this.name,
  required this.email,
  required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Text(name[0], style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(email, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),);
  }
}

class InfoBadge extends StatelessWidget {
  final String label;
  final int count;
  final Color badgeColor;
  
  const InfoBadge({
    Key? key,
    required this.label,
    required this.count,
    required this.badgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text('$count', style: TextStyle(color: badgeColor, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class ComposeWidget extends StatelessWidget {
  const ComposeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          CustomCard(title: 'Profile card used again',
           subtitle: 'Widget composition is done',
            icon: Icons.build,
             color: Colors.green),
             SizedBox(height: 10,),
             InfoBadge(label: 'Again new feature',
              count: 1,
              badgeColor: Colors.orange),
        ],
      ),
    );
  }
}

class StatelessFormExample extends StatelessWidget {
  const StatelessFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          statelessInputField(label: 'Name', hintText: 'Enter your name'),
          SizedBox(height: 10,),
          statelessInputField(label: 'Email', hintText: 'Enter your email'),
          SizedBox(height: 10,),
          StatelessButton(text: 'Submit', color: Colors.blue),
        ],
      ),
    );
  }
}

class statelessInputField extends StatelessWidget {
  final String label;
  final String hintText;

  const statelessInputField({Key? key,
  required this.label,
  required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5,),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        )
      ],
    );
  }
}

class StatelessButton extends StatelessWidget {
  final String text;
  final Color color;

  const StatelessButton({Key? key,
  required this.text,
  required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button Pressed: $text');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(text),
    );
  }
}

class StatefullWidgetExamples extends StatefulWidget {
  const StatefullWidgetExamples({super.key});

  @override
  State<StatefullWidgetExamples> createState() => _StatefullWidgetExamplesState();
}

class _StatefullWidgetExamplesState extends State<StatefullWidgetExamples> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}