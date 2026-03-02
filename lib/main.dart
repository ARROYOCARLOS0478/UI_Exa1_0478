import 'package:flutter/material.dart';
import 'widgets/pantalla_naranja.dart';
import 'widgets/pantalla_azul.dart';
import 'widgets/pantalla_oliva.dart';

void main() => runApp(const RappiCarlosApp());

class RappiCarlosApp extends StatelessWidget {
  const RappiCarlosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RappiCarlos',
      theme: ThemeData(useMaterial3: true),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pantallas = [
    const PantallaNaranja(),
    const PantallaAzul(),
    const PantallaOliva(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        // Dentro de BottomNavigationBar en main.dart
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Restaurantes'),
        BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Repartidores'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Pedidos'),
      ],
      ),
    );
  }
}