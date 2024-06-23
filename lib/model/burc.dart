// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcOzellikleri;
  final String _burcKucukResim;
  final String _burcBuyukResim;

  Burc(
      {required String burcAdi,
      required String burcTarihi,
      required String burcOzellikleri,
      required String burcKucukResim,
      required String burcBuyukResim})
      : _burcAdi = burcAdi,
        _burcTarihi = burcTarihi,
        _burcOzellikleri = burcOzellikleri,
        _burcKucukResim = burcKucukResim,
        _burcBuyukResim = burcBuyukResim;

  String get burcAdiGoster => _burcAdi;
  String get burcTarihiGoster => _burcTarihi;
  String get burcOzellikleriGoster => _burcOzellikleri;
  String get burcKucukResimGoster => _burcKucukResim;
  String get burcBuyukResimGoster => _burcBuyukResim;

  @override
  String toString() {
    return _burcKucukResim + _burcKucukResim;
  }
}
