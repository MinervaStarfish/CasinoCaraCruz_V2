// enum para el repartidor
import '../juego/funciones.dart';
import 'clientes.dart';

// Colores fichas
enum ColorFicha { Roja, Azul, Dorada }

// Casinos repartidor
enum Casinos {
  adenBaden,
  sunCity,
  caesarsPalace,
  bellagio,
  monteCarlo,
}

// Clase para el repartidor
class Repartidor {
  String nombre;
  String apellido;
  int id;
  Casinos casino;
  int dineroEfectivo;

  // Valores fichas
  final Map<ColorFicha, int> valores = {
    ColorFicha.Roja: 15000,
    ColorFicha.Azul: 25000,
    ColorFicha.Dorada: 50000,
  };

  Repartidor({
    required this.nombre,
    required this.apellido,
    required this.id,
    required this.casino,
    required this.dineroEfectivo,
  });

  // Método para vender fichas
  void venderFichas(int cantidad, Cliente cliente) {
    ColorFicha color =
        colorFichas(); // Obtenemos un color de ficha aleatorio en el archivo funciones
    int valorFicha =
        valores[color]!; // Obtenemos el valor de la ficha correspondiente

    // Verificamos si el cliente tiene suficiente dinero para comprar las fichas
    if (cliente.dineroEfectivo < valorFicha * cantidad) {
      print('El cliente no tiene suficiente dinero para comprar las fichas.');
      return;
    }

    // Vendemos las fichas al cliente y actualizamos sus valores
    cliente.dineroEfectivo -= valorFicha * cantidad;
    cliente.fichas[color] = cliente.fichas[color]! + cantidad;

    // Actualizamos el efectivo del repartidor
    dineroEfectivo += valorFicha * cantidad;
  }
}
