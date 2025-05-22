import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/seat_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/error_dialog.dart';
import '../models/trip_model.dart';

class ResultsBookingScreen extends StatefulWidget {
  @override
  _ResultsBookingScreenState createState() => _ResultsBookingScreenState();
}

class _ResultsBookingScreenState extends State<ResultsBookingScreen> {
  List<TripModel> trips = [];
  String? selectedTripId;
  int? selectedSeat;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      // Fetch trips based on args (from, to, date)
      // For demo, create dummy trips
      trips = [
        TripModel(
          id: 'trip1',
          departure: args['from'],
          destination: args['to'],
          departureTime: args['date'].add(Duration(hours: 8)),
          price: 150000,
          availableSeats: 5,
        ),
        TripModel(
          id: 'trip2',
          departure: args['from'],
          destination: args['to'],
          departureTime: args['date'].add(Duration(hours: 12)),
          price: 200000,
          availableSeats: 3,
        ),
      ];
    }
  }

  void selectSeat(int seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
    });
  }

  void proceedToPayment() {
    if (selectedTripId != null && selectedSeat != null) {
      Navigator.of(context).pushNamed('/payment', arguments: {
        'tripId': selectedTripId,
        'seatNumber': selectedSeat,
      });
    } else {
      ErrorDialog.show(context, 'Vui lòng chọn chuyến và ghế');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả & Đặt vé'),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Giờ khởi hành: ${DateFormat('HH:mm').format(trip.departureTime)}'),
              subtitle: Text('Giá vé: ${trip.price} VND - Ghế trống: ${trip.availableSeats}'),
              trailing: Radio<String>(
                value: trip.id,
                groupValue: selectedTripId,
                onChanged: (value) {
                  setState(() {
                    selectedTripId = value;
                    selectedSeat = null; // Reset seat selection when trip changes
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: selectedTripId != null
          ? Container(
              padding: EdgeInsets.all(16),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chọn ghế:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: List.generate(10, (index) {
                      final seatNumber = index + 1;
                      final isSelected = selectedSeat == seatNumber;
                      return SeatWidget(
                        seatNumber: seatNumber,
                        isSelected: isSelected,
                        onSelect: selectSeat,
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Tiếp tục thanh toán',
                    onPressed: proceedToPayment,
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
