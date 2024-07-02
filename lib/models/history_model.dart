class SearchHistory {
  String location;
  double temperature;
  DateTime time;

  SearchHistory({
    required this.location,
    required this.temperature,
    required this.time,
  });

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      location: json["location"],
      temperature: json["temperature"],
      time: DateTime.parse(json["timestamp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "temperature": temperature,
      "timestamp": time.toIso8601String(),
    };
  }
}
