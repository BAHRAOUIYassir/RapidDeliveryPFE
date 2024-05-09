import 'package:flutter/material.dart';

class StyledDateFiled extends StatefulWidget {
  const StyledDateFiled({super.key});

  @override
  State<StyledDateFiled> createState() => _StyledDateFiledState();
}

class _StyledDateFiledState extends State<StyledDateFiled> {
  //final String labelText;
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: const InputDecoration(
        labelText: 'DATE DE NAISSANCE',
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Color.fromARGB(255, 238, 243, 253),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 171, 74), width: 2.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        prefixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
        firstDate: DateTime(1950),
        lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)));

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
    }
  }
}
