class Character {
  final String id;
  final String name;
  final String? image;
  final String? house;
  final String? bloodStatus;
  final String? born;
  final String? died;
  final String? eyeColor;
  final String? hairColor;
  final String? gender;
  final String? nationality;
  final String? species;
  final String? skinColor;
  final List<String> familyMembers;
  final List<String> jobs;
  final List<String> titles;
  final String? wiki;

  Character({
    required this.id,
    required this.name,
    this.image,
    this.house,
    this.bloodStatus,
    this.born,
    this.died,
    this.eyeColor,
    this.hairColor,
    this.gender,
    this.nationality,
    this.species,
    this.skinColor,
    this.familyMembers = const [],
    this.jobs = const [],
    this.titles = const [],
    this.wiki,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] ?? {};
    
    return Character(
      id: json['id'] ?? '',
      name: attributes['name'] ?? 'Unknown',
      image: attributes['image'],
      house: attributes['house'],
      bloodStatus: attributes['blood_status'],
      born: attributes['born'],
      died: attributes['died'],
      eyeColor: attributes['eye_color'],
      hairColor: attributes['hair_color'],
      gender: attributes['gender'],
      nationality: attributes['nationality'],
      species: attributes['species'],
      skinColor: attributes['skin_color'],
      familyMembers: List<String>.from(attributes['family_members'] ?? []),
      jobs: List<String>.from(attributes['jobs'] ?? []),
      titles: List<String>.from(attributes['titles'] ?? []),
      wiki: attributes['wiki'],
    );
  }
}