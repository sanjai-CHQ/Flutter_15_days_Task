import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vetnet Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: VetnetProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VetnetProfilePage extends StatefulWidget {
  @override
  _VetnetProfilePageState createState() => _VetnetProfilePageState();
}

class _VetnetProfilePageState extends State<VetnetProfilePage> {
  int currentTabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Cover Image
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/waterfall_cover.jpg'), // You'll need to add this image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Edit Cover Button
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text('Edit Cover', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 140),
                // Profile Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Profile Image
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/profile_image.jpg'), // You'll need to add this image
                            backgroundColor: Colors.grey[300],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xFF3B2F8A),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.camera_alt, color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Name and Verification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rithi Mahesh Kumar B',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Verified Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified, color: Colors.blue, size: 20),
                          SizedBox(width: 4),
                          Text('Verified User', style: TextStyle(color: Colors.blue, fontSize: 14)),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Bio
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'I am rithi mahesh kumar, I am a full stack devoper ❤️ ❤️',
                                style: TextStyle(fontSize: 14, color: Colors.black87),
                              ),
                            ),
                            Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey[600], size: 16),
                                SizedBox(width: 4),
                                Text('Coimbatore', style: TextStyle(color: Colors.black87)),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Profile Completion
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.warning_amber, color: Colors.orange, size: 20),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Profile Completion', style: TextStyle(fontWeight: FontWeight.w600)),
                                    Text('Needs Work', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                  ],
                                ),
                                Spacer(),
                                Text('45%', style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 8),
                                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/images/profile_image.jpg')),
                                SizedBox(width: 8),
                                Text('45%', style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 8),
                                Text('3/7', style: TextStyle(color: Colors.grey[600])),
                                Spacer(),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              child: LinearProgressIndicator(
                                value: 0.45,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B2F8A)),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                                  SizedBox(width: 4),
                                  Text('Complete Profile (+55%)', style: TextStyle(color: Colors.grey[700])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Tab Navigation
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => currentTabIndex = 0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: currentTabIndex == 0 ? Color(0xFF3B2F8A) : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: currentTabIndex == 0 ? Color(0xFF3B2F8A) : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => currentTabIndex = 1),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: currentTabIndex == 1 ? Color(0xFF3B2F8A) : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Activity',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: currentTabIndex == 1 ? Color(0xFF3B2F8A) : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Tab Content
                      if (currentTabIndex == 0) _buildProfileTab(),
                      if (currentTabIndex == 1) _buildActivityTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return Column(
      children: [
        // Contact Information
        _buildSectionCard(
          title: 'Contact Information',
          icon: Icons.contact_mail,
          child: Column(
            children: [
              _buildContactItem(
                icon: Icons.email,
                label: 'Email',
                value: 'rithi@gmail.com',
                color: Colors.blue,
              ),
              SizedBox(height: 12),
              _buildContactItem(
                icon: Icons.phone,
                label: 'Phone',
                value: '9344962754',
                color: Colors.green,
              ),
              SizedBox(height: 12),
              _buildContactItem(
                icon: Icons.cake,
                label: 'Date of Birth',
                value: 'Jun 29, 2000',
                color: Colors.purple,
              ),
              SizedBox(height: 12),
              _buildContactItem(
                icon: Icons.language,
                label: 'Website',
                value: '',
                color: Colors.orange,
                isEmpty: true,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Experience Section
        _buildSectionCard(
          title: 'Experience',
          subtitle: '0 positions',
          icon: Icons.work,
          hasAddButton: true,
          buttonText: 'Add experience',
          emptyText: 'No experience added yet',
          emptySubtext: 'Showcase your professional journey by adding your work experience',
        ),
        SizedBox(height: 20),
        // Education Section
        _buildEducationCard(),
        SizedBox(height: 20),
        // Skills Section
        _buildSkillsCard(),
        SizedBox(height: 20),
        // Certifications Section
        _buildSectionCard(
          title: 'Certifications',
          subtitle: '0 certifications',
          icon: Icons.star,
          hasAddButton: true,
          buttonText: 'Add',
          emptyText: 'No certifications yet',
        ),
        SizedBox(height: 20),
        // Social Links
        _buildSocialLinksCard(),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildActivityTab() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(Icons.local_activity, size: 60, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'No Activity Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your activity will appear here',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    String? subtitle,
    required IconData icon,
    Widget? child,
    bool hasAddButton = false,
    String? buttonText,
    String? emptyText,
    String? emptySubtext,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF3B2F8A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Color(0xFF3B2F8A), size: 20),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                  ],
                ),
              ),
              if (hasAddButton)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF3B2F8A)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 16, color: Color(0xFF3B2F8A)),
                      SizedBox(width: 4),
                      Text(
                        buttonText ?? 'Add',
                        style: TextStyle(color: Color(0xFF3B2F8A), fontSize: 12),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (child != null) ...[
            SizedBox(height: 16),
            child,
          ] else if (emptyText != null) ...[
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Icon(Icons.work_outline, size: 40, color: Colors.grey[400]),
                  SizedBox(height: 12),
                  Text(
                    emptyText,
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700]),
                  ),
                  if (emptySubtext != null) ...[
                    SizedBox(height: 4),
                    Text(
                      emptySubtext,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEducationCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF3B2F8A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.school, color: Color(0xFF3B2F8A), size: 20),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Education',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Text(
                      '0 degrees',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3B2F8A)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 16, color: Color(0xFF3B2F8A)),
                    SizedBox(width: 4),
                    Text('Add', style: TextStyle(color: Color(0xFF3B2F8A), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Error message
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.error, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Failed to load education data: Exception: Failed to ...',
                    style: TextStyle(color: Colors.red[700], fontSize: 12),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Retry', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Icon(Icons.school_outlined, size: 40, color: Colors.grey[400]),
                SizedBox(height: 12),
                Text(
                  'No education added yet',
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700]),
                ),
                SizedBox(height: 4),
                Text(
                  'Add your education to showcase your academic journey',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF3B2F8A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.psychology, color: Color(0xFF3B2F8A), size: 20),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Text(
                      '1 skill',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3B2F8A)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 16, color: Color(0xFF3B2F8A)),
                    SizedBox(width: 4),
                    Text('Add', style: TextStyle(color: Color(0xFF3B2F8A), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Skills list
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'J',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Java and JavaScript', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: Colors.white, size: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinksCard() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(Icons.link, size: 60, color: Colors.grey[400]),
              SizedBox(height: 16),
              Text(
                'No social links added',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Add your social media profiles to help others connect with you',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xFF3B2F8A),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Add Social Links',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    bool isEmpty = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
                ),
                if (!isEmpty)
                  Text(
                    value,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
              ],
            ),
          ),
          Icon(Icons.open_in_new, color: Colors.grey[600], size: 16),
        ],
      ),
    );
  }
}