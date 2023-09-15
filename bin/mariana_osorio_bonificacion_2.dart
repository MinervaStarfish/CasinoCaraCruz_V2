import 'clases/clientes.dart';
import 'clases/repartidor.dart';
import 'juego/funciones.dart';
import 'juego/juego.dart';
import 'juego/util.dart';

void main(List<String> arguments) {
  // Objeto de Cliente 1
  Cliente cliente1 = Cliente(
    nombre: 'Julieta',
    apellido: 'Ruiz',
    id: 123,
    ciudad: Ciudades.Cucuta,
    dineroEfectivo: 500000,
    fichas: {
      ColorFicha.Roja: 0,
      ColorFicha.Azul: 0,
      ColorFicha.Dorada: 0,
    },
  );

  // Objeto de Cliente 2
  Cliente cliente2 = Cliente(
    nombre: 'Michael',
    apellido: 'París',
    id: 456,
    ciudad: Ciudades.Medellin,
    dineroEfectivo: 500000,
    fichas: {
      ColorFicha.Roja: 0,
      ColorFicha.Azul: 0,
      ColorFicha.Dorada: 0,
    },
  );

  // Objeto de Repartidor
  Repartidor miRepartidor = Repartidor(
    nombre: 'Sofía',
    apellido: 'Hernandez',
    id: 000,
    casino: Casinos.monteCarlo,
    dineroEfectivo: 0,
  );

  // Llamar al método jugar() en el objeto de la clase Juego
  // Objeto de Juego
  Juego juego = Juego(
    nombre: 'Poker',
    montoMinimo: 1000,
    cantidadMaximaJugadores: 6,
  );

// Agregar clientes al juego
  juego.agregarCliente(cliente1);
  juego.agregarCliente(cliente2);

// Iniciar el juego
  juego.iniciarJuego();
}
