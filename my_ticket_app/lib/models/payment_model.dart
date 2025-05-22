class PaymentModel {
  final String id;
  final String bookingId;
  final double amount;
  final DateTime paymentDate;
  final String paymentMethod; // e.g., Stripe, PayPal
  final String status; // e.g., success, failed

  PaymentModel({
    required this.id,
    required this.bookingId,
    required this.amount,
    required this.paymentDate,
    required this.paymentMethod,
    required this.status,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] ?? '',
      bookingId: json['bookingId'] ?? '',
      amount: (json['amount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate']),
      paymentMethod: json['paymentMethod'] ?? '',
      status: json['status'] ?? 'success',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingId': bookingId,
      'amount': amount,
      'paymentDate': paymentDate.toIso8601String(),
      'paymentMethod': paymentMethod,
      'status': status,
    };
  }
}
