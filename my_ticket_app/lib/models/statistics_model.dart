class StatisticsModel {
  final int totalTicketsSold;
  final double totalRevenue;
  final double cancellationRate;
  final DateTime date;

  StatisticsModel({
    required this.totalTicketsSold,
    required this.totalRevenue,
    required this.cancellationRate,
    required this.date,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      totalTicketsSold: json['totalTicketsSold'] ?? 0,
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      cancellationRate: (json['cancellationRate'] as num).toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalTicketsSold': totalTicketsSold,
      'totalRevenue': totalRevenue,
      'cancellationRate': cancellationRate,
      'date': date.toIso8601String(),
    };
  }
}
