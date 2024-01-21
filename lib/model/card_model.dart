import 'dart:convert';
import 'package:http/http.dart' as http;

class CardModel {
  int id;
  bool active = true;
  int status;
  String team;
  String title;
  String content;
  int reporter_id;
  List<int> reviewer_id;

  CardModel({
    required this.id,
    required this.active,
    required this.status,
    required this.team,
    required this.title,
    required this.content,
    required this.reporter_id,
    required this.reviewer_id,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      active: json['active'],
      status: json['status'],
      team: json['team'],
      title: json['title'],
      content: json['content'],
      reporter_id: json['reporter_id'],
      reviewer_id: json['reviewer_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'active': active,
      'status': status,
      'team': team,
      'title': title,
      'content': content,
      'reporter_id': content,
      'reviewer_id': content,
    };
  }

  static Future<CardModel> fetchCard(String cardId) async {
    final response = await http.get(Uri.parse('https://api.example.com/cards/$cardId'));

    if (response.statusCode == 200) {
      return CardModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load card');
    }
  }

  static Future<List<CardModel>> fetchAllCards() async {
    final response = await http.get(Uri.parse('https://api.example.com/cards'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return List<CardModel>.from(jsonResponse.map((model) => CardModel.fromJson(model)));
    } else {
      throw Exception('Failed to load cards');
    }
  }

  static Future<void> createCard(CardModel newCard) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/cards'),
      body: jsonEncode(newCard.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      newCard.id = jsonDecode(response.body)['id'];
    } else {
      throw Exception('Failed to create card');
    }
  }

  static Future<void> updateCardStatus(String cardId, int newStatus) async {
    final response = await http.put(
      Uri.parse('https://api.example.com/cards/$cardId'),
      body: jsonEncode({'status': newStatus}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update card status');
    }
  }

  static Future<void> deleteCard(String cardId) async {
    final response = await http.delete(Uri.parse('https://api.example.com/cards/$cardId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete card');
    }
  }
}
