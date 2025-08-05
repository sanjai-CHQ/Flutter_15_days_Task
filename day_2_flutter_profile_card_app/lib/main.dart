import 'package:flutter/material.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      home: ProfileCardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true, 
      ),
      backgroundColor: Colors.grey[100],

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 400), // Responsive width
            child: _buildProfileCard(),
          ),
        ),
      ),
    );
  }

Widget _buildProfileCard() {
return Container(
  width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.all(30),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blue[300]!, Colors.blue[600]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                ),
                ),

                
                Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
                

                /*
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/photo.jpg'),
                ),
                */
              ],
            ),

            SizedBox(height: 25,),

            Text(
              'Sanjai',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10,),

            Text(
              'AI and ML engineer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              child: Text(
                'Working in Command HQ as a ML and full stack engineer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
          ],
        )
      ),
);
}

}