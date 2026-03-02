import 'package:flutter/material.dart';

// Modelo para los Restaurantes
class Restaurante {
  final String nombre;
  final String categoria;
  final String rating;
  final String imagen;
  final String tiempo;
  bool esFavorito; // Nuevo campo para el estado del corazón

  Restaurante({
    required this.nombre,
    required this.categoria,
    required this.rating,
    required this.imagen,
    required this.tiempo,
    this.esFavorito = false, // Por defecto no es favorito
  });
}

class PantallaNaranja extends StatefulWidget {
  const PantallaNaranja({super.key});

  @override
  State<PantallaNaranja> createState() => _PantallaNaranjaState();
}

class _PantallaNaranjaState extends State<PantallaNaranja> {
  // 1. Lista de Categorías de GitHub
  final List<String> categoriasImg = [
    'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/burger.jfif',
    'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/carne.jfif',
    'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/helado.jfif',
    'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/pizza.jfif',
    'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/pollo.jfif',
  ];

  // 2. Lista de Restaurantes
  final List<Restaurante> misRestaurantes = [
    Restaurante(
      nombre: "El Corral",
      categoria: "Hamburguesas Gourmet",
      rating: "4.8",
      tiempo: "25-30 min",
      imagen: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/corral.jfif",
    ),
    Restaurante(
      nombre: "McDonald's",
      categoria: "Comida rápida",
      rating: "4.5",
      tiempo: "20-25 min",
      imagen: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/donals.jfif",
    ),
    Restaurante(
      nombre: "Frisby",
      categoria: "Pollo Apanado",
      rating: "4.7",
      tiempo: "30-35 min",
      imagen: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/frisby.jfif",
    ),
    Restaurante(
      nombre: "KFC",
      categoria: "Pollo Frito",
      rating: "4.6",
      tiempo: "28-32 min",
      imagen: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/kfc.jfif",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('RappiCarlos - Restaurantes - Carlos Arroyo 6I', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.white),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("¿Qué se te antoja hoy?", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          
          // FILA DE CATEGORÍAS
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriasImg.length,
              itemBuilder: (context, index) => Container(
                width: 75,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: ClipOval(
                  child: Image.network(
                    categoriasImg[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          
          const Divider(height: 30, thickness: 1),

          // LISTA DE RESTAURANTES
          Expanded(
            child: ListView.builder(
              itemCount: misRestaurantes.length,
              itemBuilder: (context, index) {
                final rest = misRestaurantes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        rest.imagen, 
                        width: 70, height: 70, 
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(rest.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rest.categoria),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            Text(" ${rest.rating}  •  "),
                            const Icon(Icons.timer_outlined, color: Colors.grey, size: 18),
                            Text(" ${rest.tiempo}"),
                          ],
                        ),
                      ],
                    ),
                    // BOTÓN DE CORAZÓN FUNCIONAL
                    trailing: IconButton(
                      icon: Icon(
                        rest.esFavorito ? Icons.favorite : Icons.favorite_border,
                        color: rest.esFavorito ? Colors.orange : Colors.grey,
                      ),
                      onPressed: () {
                        // setState le dice a Flutter que redibuje la pantalla
                        setState(() {
                          rest.esFavorito = !rest.esFavorito;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}