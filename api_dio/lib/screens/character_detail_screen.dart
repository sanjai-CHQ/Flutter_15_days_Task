import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    // Debug prints to check character data
    print('=== CHARACTER DEBUG INFO ===');
    print('Name: ${character.name}');
    print('House: ${character.house}');
    print('Image: ${character.image}');
    print('Species: ${character.species}');
    print('Gender: ${character.gender}');
    print('Blood Status: ${character.bloodStatus}');
    print('Born: ${character.born}');
    print('Died: ${character.died}');
    print('Family: ${character.familyMembers}');
    print('Jobs: ${character.jobs}');
    print('Titles: ${character.titles}');
    print('========================');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Always show character name (basic test)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Text(
                        character.name.isNotEmpty ? character.name : 'Unknown Character',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'House: ${character.house ?? 'Unknown'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildQuickInfoChips(),
                const SizedBox(height: 20),
                _buildPhysicalAppearance(),
                const SizedBox(height: 20),
                _buildLifeDetails(),
                const SizedBox(height: 20),
                _buildFamilyAndRelations(),
                const SizedBox(height: 20),
                _buildCareerSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      backgroundColor: _getHouseColor(character.house ?? ''),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            character.image != null && character.image!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: character.image!,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 8),
                            Text('Loading image...'),
                          ],
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            _getHouseColor(character.house ?? '').withOpacity(0.8),
                            _getHouseColor(character.house ?? ''),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, size: 100, color: Colors.white),
                            SizedBox(height: 8),
                            Text('Image failed to load', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _getHouseColor(character.house ?? '').withOpacity(0.8),
                          _getHouseColor(character.house ?? ''),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 100, color: Colors.white),
                          SizedBox(height: 8),
                          Text('No image available', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickInfoChips() {
    List<Widget> chips = [];
    
    if (character.species != null && character.species!.isNotEmpty) {
      chips.add(_buildInfoChip(
        character.species!,
        Icons.pets,
        Colors.teal,
      ));
    }
    
    if (character.gender != null && character.gender!.isNotEmpty) {
      chips.add(_buildInfoChip(
        character.gender!,
        character.gender!.toLowerCase() == 'male' ? Icons.male : Icons.female,
        character.gender!.toLowerCase() == 'male' ? Colors.blue : Colors.pink,
      ));
    }
    
    if (character.bloodStatus != null && character.bloodStatus!.isNotEmpty) {
      chips.add(_buildInfoChip(
        character.bloodStatus!,
        Icons.water_drop,
        Colors.red[400]!,
      ));
    }
    
    if (character.nationality != null && character.nationality!.isNotEmpty) {
      chips.add(_buildInfoChip(
        character.nationality!,
        Icons.flag,
        Colors.indigo,
      ));
    }

    // Always show at least one test chip if no data
    if (chips.isEmpty) {
      chips.add(_buildInfoChip('Test Chip', Icons.info, Colors.grey));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text('Info:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: chips,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhysicalAppearance() {
    if (character.eyeColor == null && character.hairColor == null && character.skinColor == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.purple[50]!, Colors.blue[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.face, color: Colors.purple[700], size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Physical Appearance',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (character.eyeColor != null) ...[
                    Expanded(
                      child: _buildAppearanceItem(
                        'Eyes',
                        character.eyeColor!,
                        Icons.visibility,
                        Colors.blue[600]!,
                      ),
                    ),
                  ],
                  if (character.eyeColor != null && (character.hairColor != null || character.skinColor != null))
                    const SizedBox(width: 16),
                  if (character.hairColor != null) ...[
                    Expanded(
                      child: _buildAppearanceItem(
                        'Hair',
                        character.hairColor!,
                        Icons.content_cut,
                        Colors.brown[600]!,
                      ),
                    ),
                  ],
                  if (character.hairColor != null && character.skinColor != null)
                    const SizedBox(width: 16),
                  if (character.skinColor != null) ...[
                    Expanded(
                      child: _buildAppearanceItem(
                        'Skin',
                        character.skinColor!,
                        Icons.palette,
                        Colors.orange[600]!,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppearanceItem(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildLifeDetails() {
    if (character.born == null && character.died == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.green[50]!, Colors.teal[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.timeline, color: Colors.green[700], size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Life Timeline',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (character.born != null)
                _buildTimelineItem('Born', character.born!, Icons.cake, Colors.green[600]!),
              if (character.born != null && character.died != null)
                const SizedBox(height: 16),
              if (character.died != null)
                _buildTimelineItem('Died', character.died!, Icons.favorite_border, Colors.red[400]!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyAndRelations() {
    if (character.familyMembers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.orange[50]!, Colors.red[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.family_restroom, color: Colors.orange[700], size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Family & Relations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: character.familyMembers.map((member) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: Colors.orange[600], size: 18),
                      const SizedBox(width: 8),
                      Text(
                        member,
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCareerSection() {
    if (character.jobs.isEmpty && character.titles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.indigo[50]!, Colors.purple[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.work_outline, color: Colors.indigo[700], size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Career & Achievements',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (character.jobs.isNotEmpty) ...[
                _buildCareerItem('Jobs', character.jobs, Icons.business_center, Colors.indigo[600]!),
                if (character.titles.isNotEmpty) const SizedBox(height: 16),
              ],
              if (character.titles.isNotEmpty)
                _buildCareerItem('Titles', character.titles, Icons.military_tech, Colors.purple[600]!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCareerItem(String title, List<String> items, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withOpacity(0.3), width: 1),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Color _getHouseColor(String house) {
    switch (house.toLowerCase()) {
      case 'gryffindor':
        return const Color(0xFF740001);
      case 'slytherin':
        return const Color(0xFF1A472A);
      case 'ravenclaw':
        return const Color(0xFF0E1A40);
      case 'hufflepuff':
        return Color.fromARGB(255, 66, 65, 65);
      default:
        return Colors.deepPurple;
    }
  }
}