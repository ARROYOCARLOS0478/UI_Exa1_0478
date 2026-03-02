import 'package:flutter/material.dart';

// Modelo para los Pedidos
class Pedido {
  final String id;
  final String tienda;
  final String precio;
  final String status;
  final Color statusColor;
  final String imagenRed;

  Pedido({
    required this.id,
    required this.tienda,
    required this.precio,
    required this.status,
    required this.statusColor,
    required this.imagenRed,
  });
}

class PantallaOliva extends StatelessWidget {
  const PantallaOliva({super.key});

  @override
  Widget build(BuildContext context) {
    const Color verdeOliva = Color(0xFF556B2F);

    // Imágenes de red para las categorías (Logística/Pedidos)
    final List<String> categoriasImg = [
      'https://cdn-icons-png.flaticon.com/512/3500/3500833.png', // Paquete
      'https://cdn-icons-png.flaticon.com/512/2649/2649279.png', // Recibo
      'https://cdn-icons-png.flaticon.com/512/1611/1611154.png', // Bolsa
      'https://cdn-icons-png.flaticon.com/512/1162/1162456.png', // Moto
      'https://cdn-icons-png.flaticon.com/512/2769/2769339.png', // Ubicación
    ];

    // Datos únicos para cada pedido
    final List<Pedido> misPedidos = [
      Pedido(
        id: "OR-9921",
        tienda: "Burgers Carlos",
        precio: "\$240.00",
        status: "En camino",
        statusColor: Colors.orange,
        imagenRed: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=100",
      ),
      Pedido(
        id: "OR-8840",
        tienda: "Tacos El Charly",
        precio: "\$150.00",
        status: "Entregado",
        statusColor: verdeOliva,
        imagenRed: "https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=100",
      ),
      Pedido(
        id: "OR-7712",
        tienda: "Pizza Don Carlos",
        precio: "\$320.00",
        status: "Cancelado",
        statusColor: Colors.red,
        imagenRed: "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=100",
      ),
      Pedido(
        id: "OR-6541",
        tienda: "Sushi Carlos-San",
        precio: "\$410.00",
        status: "Entregado",
        statusColor: verdeOliva,
        imagenRed: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=100",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeOliva,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('RappiCarlos - Pedidos', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.history, color: Colors.white),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Estatus de envíos", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          
          // FILA DE CATEGORÍAS CON IMÁGENES DE RED
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriasImg.length,
              itemBuilder: (context, index) => Container(
                width: 60,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: verdeOliva, width: 2),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(categoriasImg[index], fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text("Mis Pedidos Recientes", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: verdeOliva)),
          ),

          // LISTA DE PEDIDOS CON DISEÑO MEJORADO
          Expanded(
            child: ListView.builder(
              itemCount: misPedidos.length,
              itemBuilder: (context, index) {
                final pedido = misPedidos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(pedido.imagenRed, width: 50, height: 50, fit: BoxFit.cover),
                    ),
                    title: Text(pedido.tienda, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Orden: ${pedido.id}"),
                        Text(pedido.precio, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.circle, size: 12, color: Colors.transparent), // Espaciador
                        Text(
                          pedido.status, 
                          style: TextStyle(color: pedido.statusColor, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                      ],
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