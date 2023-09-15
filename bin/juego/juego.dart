import '../clases/clientes.dart';
import '../clases/repartidor.dart';
import 'funciones.dart';
import '../mariana_osorio_bonificacion_2.dart';

class Juego {
  String nombre;
  int montoMinimo;
  int cantidadMaximaJugadores;
  List<Cliente> _clientes = [];

  Juego({
    required this.nombre,
    required this.montoMinimo,
    required this.cantidadMaximaJugadores,
  });

  void agregarCliente(Cliente cliente) {
    if (_clientes.length < cantidadMaximaJugadores) {
      _clientes.add(cliente);
    } else {
      print('El juego ha alcanzado su límite máximo de jugadores.');
    }
  }

  void iniciarJuego() {
    if (_clientes.length < 2) {
      print('No hay suficientes jugadores para iniciar el juego.');
      return;
    }

    print('Iniciando el juego $nombre');

    for (var i = 0; i < _clientes.length; i++) {
      Cliente cliente = _clientes[i];
      print('El jugador ${cliente.nombre} ${cliente.apellido} está jugando.');
      apostar(
          montoMinimo,
          cliente,
          Repartidor(
            nombre: 'Sofía',
            apellido: 'Hernandez',
            id: 000,
            casino: Casinos.monteCarlo,
            dineroEfectivo: 0,
          ));
    }

    print('El juego ha terminado.');
  }
}
