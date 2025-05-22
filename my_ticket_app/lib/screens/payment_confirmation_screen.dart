import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/custom_button.dart';
import '../widgets/error_dialog.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  @override
  _PaymentConfirmationScreenState createState() => _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  bool _isProcessing = false;
  bool _paymentSuccess = false;

  Future<void> _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      // TODO: Integrate real payment gateway here (Stripe/PayPal)
      await Future.delayed(Duration(seconds: 3)); // Simulate payment delay

      setState(() {
        _paymentSuccess = true;
      });
    } catch (e) {
      ErrorDialog.show(context, 'Thanh toán thất bại: \$e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _processPayment();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán & Xác nhận'),
      ),
      body: Center(
        child: _isProcessing
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Đang xử lý thanh toán...'),
                ],
              )
            : _paymentSuccess
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thanh toán thành công!',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      QrImage(
                        data: 'Ticket for trip ${args?['tripId'] ?? ''}, seat ${args?['seatNumber'] ?? ''}',
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      SizedBox(height: 16),
                      CustomButton(
                        text: 'Quay về trang chủ',
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                      ),
                    ],
                  )
                : Container(),
      ),
    );
  }
}
