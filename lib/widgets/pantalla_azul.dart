import 'package:flutter/material.dart';

// Modelo para los Repartidores
class Repartidor {
  final String nombre;
  final String vehiculo;
  final String calificacion;
  final String foto;
  final String entregas;

  Repartidor({
    required this.nombre, 
    required this.vehiculo, 
    required this.calificacion, 
    required this.foto,
    required this.entregas,
  });
}

class PantallaAzul extends StatelessWidget {
  const PantallaAzul({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulObscuro = Color(0xFF0D47A1);

    // Imágenes de red para representar tipos de flota/equipo
    final List<String> transportesImg = [
      'https://cdn-icons-png.flaticon.com/512/3198/3198336.png', // Casco
      'https://cdn-icons-png.flaticon.com/512/717/717498.png',  // Moto
      'https://cdn-icons-png.flaticon.com/512/2972/2972185.png', // Mochila
      'https://cdn-icons-png.flaticon.com/512/744/744465.png',  // Llaves
      'https://cdn-icons-png.flaticon.com/512/2156/2156707.png', // Bicicleta
    ];

    // Datos de los mejores repartidores
    final List<Repartidor> mejoresRepartidores = [
      Repartidor(
        nombre: "Carlos Pérez",
        vehiculo: "Motocicleta Yamaha",
        calificacion: "5.0",
        entregas: "1,200 entregas",
        foto: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p4.jfif",
      ),
      Repartidor(
        nombre: "Ana Martínez",
        vehiculo: "Bicicleta Eléctrica",
        calificacion: "4.9",
        entregas: "850 entregas",
        foto: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p1.jfif",
      ),
      Repartidor(
        nombre: "Roberto Gómez",
        vehiculo: "Auto Compacto",
        calificacion: "4.8",
        entregas: "2,100 entregas",
        foto: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p3.jfif",
      ),
      Repartidor(
        nombre: "Lucía Fernández",
        vehiculo: "Scooter",
        calificacion: "4.9",
        entregas: "500 entregas",
        foto: "https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes_exam/refs/heads/main/p2.jfif",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: azulObscuro,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('RappiCarlos - Repartidores', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.stars, color: Colors.white),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Filtrar por transporte", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          
          // FILA DE TRANSPORTES (Círculos con imágenes de red)
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: transportesImg.length,
              itemBuilder: (context, index) => Container(
                width: 60,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Colors.white,
                  border: Border.all(color: azulObscuro, width: 2),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      transportesImg[index],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.delivery_dining, color: azulObscuro),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Nuestros Mejores Repartidores", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: azulObscuro)),
          ),

          // LISTA DE REPARTIDORES
          Expanded(
            child: ListView.builder(
              itemCount: mejoresRepartidores.length,
              itemBuilder: (context, index) {
                final rep = mejoresRepartidores[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(rep.foto),
                    ),
                    title: Text(rep.nombre, 
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rep.vehiculo),
                        Text(rep.entregas, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(" ${rep.calificacion}", 
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                        ],
                      ),
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