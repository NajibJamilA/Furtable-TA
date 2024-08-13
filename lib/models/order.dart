class Order {
  String name;
  int totalPrice;
  String alamatPengiriman;
  String panjang;
  String lebar;
  String lebarSandaranTangan;
  String lebarDudukan;
  String tinggiSofa;
  String tinggiSandaranTangan;
  String tinggiDudukan;
  String bahanKain;
  String bahanFurniture;

  Order({
    required this.name,
    required this.totalPrice,
    required this.alamatPengiriman,
    required this.panjang,
    required this.lebar,
    required this.lebarSandaranTangan,
    required this.lebarDudukan,
    required this.tinggiSofa,
    required this.tinggiSandaranTangan,
    required this.tinggiDudukan,
    required this.bahanKain,
    required this.bahanFurniture
  });
}