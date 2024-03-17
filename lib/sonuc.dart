import 'package:flutter/material.dart';
import 'hesaplayici.dart';

// ignore: must_be_immutable
class SonucEkrani extends StatefulWidget {
  int boy;
  int kilo;
  int yas;

  SonucEkrani({required this.boy, required this.kilo, required this.yas});
  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  double vkisonuc = 0;
  String sonucMetni = "";

  @override
  void initState() {
    Mantik mantiks = Mantik();
    vkisonuc = mantiks.vkiHesapla(widget.boy, widget.kilo);

    if (vkisonuc.toString() == "Infinity") {
      print("BOY GİRİLMEMİŞ!!!!!");
    }
    if (vkisonuc < 20) {
      sonucMetni = "Zayıfsınız";
    } else if (20 > vkisonuc && vkisonuc <= 25) {
      sonucMetni = "İdeal Kilodasınız";
    } else if (25 > vkisonuc && vkisonuc <= 30) {
      sonucMetni = "Kilolusunuz";
    } else if (30 > vkisonuc && vkisonuc < 40) {
      sonucMetni = "Obezsiniz";
    } else if (vkisonuc > 40) {
      sonucMetni = "Aşırı Obezsiniz";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "VKİ Hesaplayıcı",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Color.fromARGB(170, 255, 255, 255),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vki Sonucunuz:",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${vkisonuc.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 255, 94)),
                ),
                Text(
                  "Kilo Durumunuz",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${sonucMetni.toString()}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 255, 94)),
                ),
                Text(
                  "Yaşınız:",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.yas}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 255, 94)),
                ),
              ],
            ),
          ),
        ));
  }
}
