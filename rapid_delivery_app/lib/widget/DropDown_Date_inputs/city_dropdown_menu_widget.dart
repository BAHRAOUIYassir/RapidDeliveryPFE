import 'package:flutter/material.dart';

class CityDropdownMenu extends StatefulWidget {
  const CityDropdownMenu({super.key});

  @override
  State<CityDropdownMenu> createState() => _CityDropdownMenuState();
}

class _CityDropdownMenuState extends State<CityDropdownMenu> {
  final _value = '-1';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: 'VILLE',
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
      value: _value,
      items: const [
        DropdownMenuItem(
          value: '-1',
          enabled: false,
          child: Text(
            'CHOISIR TA VILLE',
          ),
        ),
        DropdownMenuItem(
          value: '1',
          child: Text('OUED ZEM'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('MEKNES'),
        ),
        DropdownMenuItem(
          value: '3',
          child: Text('KHENIFRA'),
        ),
      ],
      onChanged: (v) {},
    );
  }
}
