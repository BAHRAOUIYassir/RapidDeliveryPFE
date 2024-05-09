import 'package:flutter/material.dart';

class VehicleDropdownMenu extends StatefulWidget {
  const VehicleDropdownMenu({super.key});

  @override
  State<VehicleDropdownMenu> createState() => _VehicleDropdownMenuState();
}

class _VehicleDropdownMenuState extends State<VehicleDropdownMenu> {
  final _value = '-1';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: 'VÉHICULE',
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
            'TYPE DE VÉHICULE',
          ),
        ),
        DropdownMenuItem(
          value: '1',
          child: Text('Voiture'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('Moto'),
        ),
        DropdownMenuItem(
          value: '3',
          child: Text('Vélo'),
        ),
        DropdownMenuItem(
          value: '4',
          child: Text('Scooter électrique'),
        ),
      ],
      onChanged: (v) {},
    );
  }
}
