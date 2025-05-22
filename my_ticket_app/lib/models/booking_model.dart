class BookingModel {
  final String id;
  final String userId;
  final String tripId;
  final int seatNumber;
  final DateTime bookingDate;
  final String status; // e.g., confirmed, cancelled

  BookingModel({
    required this.id,
    required this.userId,
    required this.tripId,
    required this.seatNumber,
    required this.bookingDate,
    required this.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      tripId: json['tripId'] ?? '',
      seatNumber: json['seatNumber'] ?? 0,
      bookingDate: DateTime.parse(json['bookingDate']),
      status: json['status'] ?? 'confirmed',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'tripId': tripId,
      'seatNumber': seatNumber,
      'bookingDate': bookingDate.toIso8601String(),
      'status': status,
    };
  }
}
