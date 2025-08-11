


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vetnet Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display',
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

class _VetnetProfilePageState extends State<VetnetProfilePage>
    with TickerProviderStateMixin {
  int currentTabIndex = 0;
  bool isContactExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Elegant Professional Color Scheme - Minimal Palette
  static const Color primaryColor = Color(0xFF2563EB); // Professional Blue
  static const Color primaryDark = Color(0xFF1D4ED8); // Darker Blue for depth
  static const Color secondaryColor = Color(0xFF1E40AF); // Darker Blue
  static const Color successColor = Color(0xFF10B981); // Green for success states only
  static const Color warningColor = Color(0xFFD97706); // Orange
  static const Color accentColor = Color(0xFF059669); // Professional Green
  static const Color surfaceColor = Color(0xFFFAFAFA); // Very light gray background
  static const Color cardColor = Color(0xFFFFFFFF); // Pure white
  static const Color textPrimary = Color(0xFF1F2937); // Dark gray for primary text
  static const Color textSecondary = Color(0xFF6B7280); // Medium gray for secondary text
  static const Color textLight = Color(0xFF9CA3AF); // Light gray for subtle text
  static const Color dividerColor = Color(0xFFE5E7EB); // Light gray for dividers
  static const Color borderColor = Color(0xFFD1D5DB); // Border color

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildTopSection(),
              _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Header with search bar
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 16,
              right: 16,
              bottom: 10,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back,
                      color: textPrimary,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.search, color: textSecondary, size: 20),
                        SizedBox(width: 12),
                        Text(
                          'Rithi Mahesh Kumar B',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.settings,
                    color: textPrimary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          // Cover and Profile Section
          Stack(
            children: [
              // Cover Image
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Stack(
                  children: [
                    // Gradient overlay similar to LinkedIn
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF9CA3AF).withOpacity(0.8),
                            Color(0xFFE5E7EB).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    // Camera icon
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: textSecondary,
                          size: 16,
                        ),
                      ),
                    ),
                    // Edit icon (pen)
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.edit,
                          color: textPrimary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Profile Image positioned over cover
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
          // Profile Info Section
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Verification
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rithi Mahesh Kumar B',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.verified,
                      color: primaryColor,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'He/Him',
                  style: TextStyle(
                    fontSize: 14,
                    color: textSecondary,
                  ),
                ),
                SizedBox(height: 8),
                // Professional Title
                Text(
                  'Full Stack Developer | Specializing in Mobile Apps, Web Development & Cloud Solutions',
                  style: TextStyle(
                    fontSize: 16,
                    color: textPrimary,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 12),
                // Company/Institution
                Text(
                  'TechCorp Solutions',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                // Location
                Text(
                  'Tamil Nadu, India',
                  style: TextStyle(
                    fontSize: 14,
                    color: textSecondary,
                  ),
                ),
                SizedBox(height: 12),
                // Connections
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    '247 connections',
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildTabContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Resume Upload Section
          _buildResumeUploadSection(),
          SizedBox(height: 20),
          // Profile Completion
          _buildProfileCompletion(),
          SizedBox(height: 20),
          // Tab Navigation
          _buildTabs(),
          SizedBox(height: 20),
          // Tab Content
          if (currentTabIndex == 0) _buildProfileTab(),
          if (currentTabIndex == 1) _buildActivityTab(),
        ],
      ),
    );
  }

  Widget _buildResumeUploadSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.description_rounded, color: Colors.white, size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Resume',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[300]!,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.cloud_upload_rounded,
                    size: 32,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Upload your resume',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Share your resume to help recruiters find you',
                  style: TextStyle(
                    fontSize: 14,
                    color: textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Handle file upload
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.upload_file_rounded, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Choose File',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Supported formats: PDF, DOC, DOCX (Max 5MB)',
                  style: TextStyle(
                    fontSize: 12,
                    color: textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCompletion() {
    return _buildCard(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: warningColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.trending_up_rounded, color: Colors.white, size: 24),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Strength',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Good - Complete to boost visibility',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: warningColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '68%',
                  style: TextStyle(
                    color: warningColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Progress Bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[200],
            ),
            child: FractionallySizedBox(
              widthFactor: 0.68,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: warningColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildButton(
            text: 'Complete Profile (+32%)',
            icon: Icons.arrow_forward_rounded,
            onTap: () {},
            isPrimary: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTabItem('Profile', 0, Icons.person_rounded)),
          Expanded(child: _buildTabItem('Activity', 1, Icons.timeline_rounded)),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index, IconData icon) {
    bool isSelected = currentTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentTabIndex = index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? primaryColor : textSecondary,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? primaryColor : textSecondary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return Column(
      children: [
        // About Section
        _buildAboutSection(),
        SizedBox(height: 16),
        // Contact Information Dropdown
        _buildDropdownSection(
          title: 'Contact Information',
          icon: Icons.contact_mail_rounded,
          isExpanded: isContactExpanded,
          onToggle: () => setState(() => isContactExpanded = !isContactExpanded),
          content: _buildContactContent(),
        ),
        SizedBox(height: 16),
        _buildProfessionalSection(),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildAboutSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.info_outline_rounded, color: Colors.white, size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                ),
              ),
              _buildIconButton(
                icon: Icons.edit_rounded,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'I am rithi mahesh kumar, I am a full stack developer ❤️ Passionate about creating amazing user experiences and building scalable applications that make a difference.',
            style: TextStyle(
              fontSize: 15,
              color: textPrimary,
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownSection({
    required String title,
    required IconData icon,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget content,
  }) {
    return _buildCard(
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: textSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? null : 0,
            child: isExpanded
                ? Column(
                    children: [
                      SizedBox(height: 16),
                      Divider(color: dividerColor, thickness: 1),
                      SizedBox(height: 16),
                      content,
                    ],
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactContent() {
    return Column(
      children: [
        _buildContactItem(
          icon: Icons.email_rounded,
          label: 'Email',
          value: 'rithi@gmail.com',
          color: primaryColor,
          onTap: () {},
        ),
        SizedBox(height: 12),
        _buildContactItem(
          icon: Icons.phone_rounded,
          label: 'Phone',
          value: '+91 93449 62754',
          color: successColor,
          onTap: () {},
        ),
        SizedBox(height: 12),
        _buildContactItem(
          icon: Icons.cake_rounded,
          label: 'Date of Birth',
          value: 'June 29, 2000',
          color: primaryColor,
          onTap: () {},
        ),
        SizedBox(height: 12),
        _buildContactItem(
          icon: Icons.language_rounded,
          label: 'Website',
          value: 'Add your website',
          color: textSecondary,
          isEmpty: true,
          onTap: () {},
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
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w600,
                      color: isEmpty ? textSecondary : textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isEmpty ? Icons.add_rounded : Icons.edit_rounded,
              color: color,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalSection() {
    return Column(
      children: [
        _buildExperienceCard(),
        SizedBox(height: 16),
        _buildProfessionalCard(
          title: 'Skills',
          subtitle: '8 skills',
          icon: Icons.psychology_rounded,
          color: secondaryColor,
          items: ['Java', 'JavaScript', 'React', 'Flutter', 'Node.js', 'Python'],
          isSkills: true,
        ),
        SizedBox(height: 16),
        _buildProfessionalCard(
          title: 'Certifications',
          subtitle: '3 certifications',
          icon: Icons.military_tech_rounded,
          color: warningColor,
          items: ['AWS Certified', 'Google Cloud Professional', 'Oracle Java SE'],
        ),
      ],
    );
  }

  Widget _buildExperienceCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.work_rounded, color: Colors.white, size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    Text(
                      '2 positions',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              _buildIconButton(
                icon: Icons.add_rounded,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildExperienceItem(
            jobTitle: 'Java Programmer',
            company: 'Black Knight Financial Services',
            location: 'Jacksonville, FL',
            duration: '2010-2018',
            description: [
              'Designed and developed up to 10 applications projects per year.',
              'Designed project requirements in cooperation with data analysis teams.',
              'Participated in project meetings, with technical staff members, business analysts, and external stakeholders.'
            ],
            isFirst: true,
          ),
          SizedBox(height: 16),
          _buildExperienceItem(
            jobTitle: 'Senior Full Stack Developer',
            company: 'TechCorp Solutions',
            location: 'Coimbatore, TN',
            duration: '2018-Present',
            description: [
              'Lead development of enterprise-level applications using modern technologies.',
              'Mentored junior developers and established coding standards.',
              'Collaborated with cross-functional teams to deliver high-quality solutions.'
            ],
            isFirst: false,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String jobTitle,
    required String company,
    required String location,
    required String duration,
    required List<String> description,
    required bool isFirst,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.business_rounded,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      company,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '$location • $duration',
                      style: TextStyle(
                        fontSize: 13,
                        color: textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...description.map((desc) => Padding(
            padding: EdgeInsets.only(left: 52, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    desc,
                    style: TextStyle(
                      fontSize: 14,
                      color: textPrimary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildProfessionalCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required List<String> items,
    bool isSkills = false,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              _buildIconButton(
                icon: Icons.add_rounded,
                onTap: () {},
              ),
            ],
          ),
          if (items.isNotEmpty) ...[
            SizedBox(height: 16),
            if (isSkills)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: items.map((skill) => _buildSkillChip(skill, color)).toList(),
              )
            else
              Column(
                children: items.map((item) => _buildListItem(item, color)).toList(),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildListItem(String item, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 8),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              item,
              style: TextStyle(
                color: textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    return _buildCard(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.timeline_rounded, size: 40, color: primaryColor),
            ),
            SizedBox(height: 20),
            Text(
              'No Activity Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your professional activities and updates will appear here',
              style: TextStyle(
                color: textSecondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, size: 16, color: textSecondary),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isPrimary ? primaryColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.25),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isPrimary) Icon(Icons.edit_rounded, size: 16, color: textSecondary),
            if (!isPrimary) SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isPrimary ? Colors.white : textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              icon,
              color: isPrimary ? Colors.white : textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
