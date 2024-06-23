import 'package:burc_rehberi_app/data/strings.dart';
import 'package:burc_rehberi_app/model/burc.dart';
import 'package:burc_rehberi_app/screens/burc_detay_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    listeyiDoldur();
  }
  List<Burc> tumBurclar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
        title: const Text(
          'Burcunuzu Seçin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: Strings.BURC_ADLARI.length,
        itemBuilder: (context, index) {
          return Card(
            color: index % 2 == 0 ? Colors.white : Colors.pink.shade100,
            shadowColor: Colors.pink,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BurcDetayScreen(
                      burcDetayi: tumBurclar[index].burcOzellikleriGoster,
                      buyukResimYolu: tumBurclar[index].burcBuyukResimGoster,
                      burcAdi: tumBurclar[index].burcAdiGoster,
                      indexNo: index,
                    );
                  },
                ));
                //tıklama görevi
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/${tumBurclar[index].burcKucukResimGoster}'),
              ),
              title: Text(tumBurclar[index].burcAdiGoster,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(tumBurclar[index].burcTarihiGoster,
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }

  void listeyiDoldur() {
    for (var i = 0; i < Strings.BURC_ADLARI.length; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcOzelligi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var kucukResimYolu =
          '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png';
      var buyukResimYolu =
          '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png';
      var geciciBurc = Burc(
          burcAdi: burcAdi,
          burcTarihi: burcTarihi,
          burcOzellikleri: burcOzelligi,
          burcKucukResim: kucukResimYolu,
          burcBuyukResim: buyukResimYolu);
      tumBurclar.add(geciciBurc);
    }
  }
}
