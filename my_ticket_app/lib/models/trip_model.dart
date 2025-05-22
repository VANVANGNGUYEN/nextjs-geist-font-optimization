class TripModel {
  final String id;
  final String departure;
  final String destination;
  final DateTime departureTime;
  final double price;
  final int availableSeats;

  TripModel({
    required this.id,
    required this.departure,
    required this.destination,
    required this.departureTime,
    required this.price,
    required this.availableSeats,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] ?? '',
      departure: json['departure'] ?? '',
      destination: json['destination'] ?? '',
      departureTime: DateTime.parse(json['departureTime']),
      price: (json['price'] as num).toDouble(),
      availableSeats: json['availableSeats'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departure': departure,
      'destination': destination,
      'departureTime': departureTime.toIso8601String(),
      'price': price,
      'availableSeats': availableSeats,
    };
  }
}
