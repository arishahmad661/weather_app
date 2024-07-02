import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/history_model.dart';

class History{
  Future<void> addToHistory(String location, double temperature) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('search_history') ?? [];
    SearchHistory newEntry = SearchHistory(
      location: location,
      temperature: temperature,
      time: DateTime.now(),
    );
    history.add(jsonEncode(newEntry.toJson()));
    await prefs.setStringList('search_history', history);
  }

  Future<List<SearchHistory>> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('search_history') ?? [];
    return history.map((item) => SearchHistory.fromJson(jsonDecode(item))).toList();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
  }

}