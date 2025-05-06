class Greenhouse {
  final String name;
  final double temperature;
  final double humidity;
  final double light;
  final double ph;

  Greenhouse({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.light,
    required this.ph,
  });

  factory Greenhouse.fromJson(Map<String, dynamic> json) {
    return Greenhouse(
      name: json['name'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      light: json['light'],
      ph: json['ph'],
    );
  }
}
