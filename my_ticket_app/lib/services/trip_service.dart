import '../models/trip_model.dart';

class TripService {
  // Placeholder for fetching trips from backend or Firebase

  Future<List<TripModel>> fetchTrips(String from, String to, DateTime date) async {
    // Implement API call or Firebase query here
    // Returning dummy data for now
    return [
      TripModel(
        id: 'trip1',
        departure: from,
        destination: to,
        departureTime: date.add(Duration(hours: 8)),
        price: 150000,
        availableSeats: 5,
      ),
      TripModel(
        id: 'trip2',
        departure: from,
        destination: to,
        departureTime: date.add(Duration(hours: 12)),
        price: 200000,
        availableSeats: 3,
      ),
    ];
  }
}
