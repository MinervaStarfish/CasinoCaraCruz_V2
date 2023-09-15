import 'dart:math';
import '../mariana_osorio_bonificacion_2.dart';
import '../clases/clientes.dart';
import '../clases/repartidor.dart';

// Funcion para fichas
ColorFicha colorFichas() {
  int random = Random().nextInt(3);

  if (random == 0) {
    return ColorFicha.Roja;
  } else if (random == 1) {
    return ColorFicha.Azul;
  } else {
    return ColorFicha.Dorada;
  }
}

// Funcion para vender fichas
void venderFichasAClientes(
    Repartidor miRepartidor, Cliente cliente1, Cliente cliente2) {
  int totalCompradoCliente1 = 0;
  int totalCompradoCliente2 = 0;

  while (cliente1.dineroEfectivo > 0) {
    miRepartidor.venderFichas(1, cliente1);
    totalCompradoCliente1++;
  }

  while (cliente2.dineroEfectivo > 0) {
    miRepartidor.venderFichas(1, cliente2);
    totalCompradoCliente2++;
  }

  print('El cliente 1 compró un total de $totalCompradoCliente1 fichas.');
  print('El cliente 2 compró un total de $totalCompradoCliente2 fichas.');
}

// Función random de cara o cruz
int lanzarMoneda() {
  Random random = Random();
  return random.nextInt(2);
}

// Funcion para resultado de random cara o cruz
String? gameResults(int machine, int user) {
  if (machine == 0) {
    return 'Perdió esta apuesta';
  } else {
    return 'Ganó esta apuesta';
  }
}

// funcion de apostar
void apostar(int cantidad, Cliente cliente, Repartidor repartidor) {
  ColorFicha color = colorFichas();
  int valorFicha = repartidor.valores[color]!;

  // Verificamos si el cliente tiene suficientes fichas para apostar
  if (cliente.fichas[color]! < cantidad) {
    print('El cliente no tiene suficientes fichas para apostar.');
    return;
  }

  int resultadoMaquina = lanzarMoneda();
  int resultadoUsuario = lanzarMoneda();
  String? resultado = gameResults(resultadoMaquina, resultadoUsuario);

  if (resultado == 'Ganó esta apuesta') {
    cliente.fichas[color] = cliente.fichas[color]! + cantidad;
    repartidor.dineroEfectivo -= valorFicha * cantidad;
    cliente.dineroEfectivo += valorFicha * cantidad;
  } else {
    cliente.fichas[color] = cliente.fichas[color]! - cantidad;
    repartidor.dineroEfectivo += valorFicha * cantidad;
    cliente.dineroEfectivo -= valorFicha * cantidad;
  }

  print('El resultado fue $resultado');
}

// funcion de comision
