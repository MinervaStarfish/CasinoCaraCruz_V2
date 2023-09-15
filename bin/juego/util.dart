import '../clases/clientes.dart';
import '../clases/repartidor.dart';

enum Resultado { Cara, Cruz }

// Clase de la apuesta
class Apuesta {
  Cliente cliente;
  Map<ColorFicha, int> fichas;
  Resultado resultado;

  Apuesta({
    required this.cliente,
    required this.fichas,
    required this.resultado,
  });
}
