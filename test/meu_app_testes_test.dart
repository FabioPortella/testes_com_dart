import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test('Calcula o valor do produto com desconto com portentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto sem porcentagem passando valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o valor do produto com desconto zerado com porcentagem', () {
    expect(() => app.calcularDesconto(100, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group("Calcula valor do produto com desconto:", () {
    var valuesToTeste = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTeste.forEach((values, expected) {
      test('Entrada: $values: Esperado: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group(
      "Calcula valor do produto informando valores zerados, dever gerar erro:",
      () {
    var valuesToTeste = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTeste) {
      test('Entrada: $values', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('testar conversão para uppercase', () {
    expect(app.convertToUpper('dio'), equals("DIO"));
  });

  test('testar conversão para uppercase, teste 2', () {
    expect(app.convertToUpper('dio'), equalsIgnoringCase("dio"));
  });
}
