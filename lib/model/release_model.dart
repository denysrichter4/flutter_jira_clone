import 'dart:convert';
import 'package:http/http.dart' as http;

class ReleaseModel {
  String id;
  int active;
  String status;
  String title;
  String notes;
  List<int> cardId;

  ReleaseModel({
    required this.id,
    required this.active,
    required this.status,
    required this.title,
    required this.notes,
    required this.cardId,
  });

  factory ReleaseModel.fromJson(Map<String, dynamic> json) {
    return ReleaseModel(
      id: json['id'],
      active: json['active'],
      status: json['status'],
      title: json['title'],
      notes: json['notes'],
      cardId: List<int>.from(json['card_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'active': active,
      'status': status,
      'title': title,
      'notes': notes,
      'card_id': cardId,
    };
  }

  static Future<ReleaseModel> fetchRelease(String releaseId) async {
    final response = await http.get(Uri.parse('https://api.example.com/releases/$releaseId'));

    if (response.statusCode == 200) {
      return ReleaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load release');
    }
  }

  static Future<List<ReleaseModel>> fetchAllReleases() async {
    final response = await http.get(Uri.parse('https://api.example.com/releases'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return List<ReleaseModel>.from(jsonResponse.map((model) => ReleaseModel.fromJson(model)));
    } else {
      throw Exception('Failed to load releases');
    }
  }

  static Future<void> createRelease(ReleaseModel newRelease) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/releases'),
      body: jsonEncode(newRelease.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Atualiza o ID com o valor retornado pelo servidor
      newRelease.id = jsonDecode(response.body)['id'];
    } else {
      throw Exception('Failed to create release');
    }
  }
}