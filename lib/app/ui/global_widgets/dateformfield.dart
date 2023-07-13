import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../theme/color.dart';

class DatePickerFormField extends StatefulWidget {
  const DatePickerFormField({Key? key}) : super(key: key);

  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  late TextEditingController _dateController;
  DateTime _selectedDate = DateTime.now();
  final DateFormat _date_Format = DateFormat('dd/MM/yyyy');
  bool _isDateSelected = false;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _dateController.text = _date_Format.format(_selectedDate);
        _isDateSelected = true;
      });
    // ignore: use_build_context_synchronously
    FocusScope.of(context).nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.sp),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: DataColors.semigrey, width: 1.0)),
        //labelText: 'Tanggal',
        hintText: 'Pilih Tanggal',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10.sp,
        ),
        prefixIcon: Icon(
          Icons.calendar_today,
          color: DataColors.primary700,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tanggal tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
