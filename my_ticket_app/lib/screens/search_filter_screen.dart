import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_button.dart';
import '../widgets/animated_transition.dart';
import '../utils/validators.dart';

class SearchFilterScreen extends StatefulWidget {
  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      Navigator.of(context).push(
        AnimatedTransition(
          page: SearchResultsScreen(
            from: _fromController.text,
            to: _toController.text,
            date: _selectedDate!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin và chọn ngày')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateText = _selectedDate == null
        ? 'Chọn ngày khởi hành'
        : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tra cứu & Lọc'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fromController,
                decoration: InputDecoration(
                  labelText: 'Điểm đi',
                  border: OutlineInputBorder(),
                ),
                validator: Validators.validateNotEmpty,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _toController,
                decoration: InputDecoration(
                  labelText: 'Điểm đến',
                  border: OutlineInputBorder(),
                ),
                validator: Validators.validateNotEmpty,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dateText,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Chọn ngày'),
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                text: 'Tìm kiếm',
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy SearchResultsScreen for navigation reference
class SearchResultsScreen extends StatelessWidget {
  final String from;
  final String to;
  final DateTime date;

  const SearchResultsScreen({
    Key? key,
    required this.from,
    required this.to,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả tìm kiếm'),
      ),
      body: Center(
        child: Text('Hiển thị kết quả từ $from đến $to vào ngày ${DateFormat('dd/MM/yyyy').format(date)}'),
      ),
    );
  }
}
