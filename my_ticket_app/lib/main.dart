import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/search_filter_screen.dart';
import 'screens/results_booking_screen.dart';
import 'screens/payment_confirmation_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(MyTicketApp());
}

class MyTicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        // Add other providers here (TripService, BookingService, etc.)
      ],
      child: MaterialApp(
        title: 'Ứng dụng Đặt Vé Xe / Tàu',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            elevation: 2,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(
                onLoginSuccess: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
          '/register': (context) => RegisterScreen(
                onRegisterSuccess: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
          '/': (context) => SearchFilterScreen(),
          '/results': (context) => ResultsBookingScreen(),
          '/payment': (context) => PaymentConfirmationScreen(),
        },
      ),
    );
  }
}
