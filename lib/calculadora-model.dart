class CalculadoraModel {
  num somar(var valor1, var valor2) {
    return num.parse(valor1) + num.parse(valor2);
  }

  num subtrair(var valor1, var valor2) {
    return num.parse(valor1) - num.parse(valor2);
  }

  num multiplicar(var valor1, var valor2) {
    return num.parse(valor1) * num.parse(valor2);
  }

  num dividir(var valor1, var valor2) {
    return num.parse(valor1) / num.parse(valor2);
  }
}
