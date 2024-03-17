import "dart:math";

class Mantik {
  double vkiHesapla(int boy, int kilo) {
    double vki = kilo / pow(boy / 100, 2);
    return vki;
  }
}
