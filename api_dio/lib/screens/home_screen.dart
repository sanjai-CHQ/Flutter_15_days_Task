import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../widgets/character_card.dart';
import 'character_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Character> _characters = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final characters = await _apiService.getCharacters(limit: 100);
      
      setState(() {
        _characters = characters;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Harry Potter Characters',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading characters...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error: $_error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadCharacters,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_characters.isEmpty) {
      return const Center(
        child: Text('No characters found'),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadCharacters,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _characters.length,
        itemBuilder: (context, index) {
          final character = _characters[index];
          return CharacterCard(
            character: character,
            onTap: () => _navigateToDetail(character),
          );
        },
      ),
    );
  }

  void _navigateToDetail(Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(character: character),
      ),
    );
  }
}