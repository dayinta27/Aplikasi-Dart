import 'dart:io';

double hitunganAwal(double harga, double jumlah) {
  return harga * jumlah;
}

void insertData(List<double> myList, List<Map<String, dynamic>> daftarHarga) {
  double? diskon;
  var totalBayar;
  List<double> myList = [];
  
  double? totalHarga, jumlah;
  var harga;

  stdout.write('Masukkan Kode Barang : ');
  var kode = stdin.readLineSync();
  switch (kode) {
    case '01':
      print(daftarHarga[0]['nama']);
      harga = double.tryParse(daftarHarga[0]['harga']);
      stdout.write('Berapa banyak : ');
      double inputJumlah = double.parse(stdin.readLineSync()!);
      totalHarga = hitunganAwal(harga, inputJumlah);
      print('Total harga = $totalHarga');
      myList.add(totalHarga);
      stdout.writeln(totalHarga);
      break;
    case '02':
      print(daftarHarga[1]['nama']);
      harga = double.tryParse(daftarHarga[1]['harga']);
      stdout.write('Berapa banyak : ');
      double inputJumlah = double.parse(stdin.readLineSync()!);
      totalHarga = hitunganAwal(harga, inputJumlah);
      print('Total harga = $totalHarga');
      myList.add(totalHarga);
      stdout.writeln(totalHarga);
      break;
    case '03':
      print(daftarHarga[2]['nama']);
      harga = double.tryParse(daftarHarga[2]['harga']);
      stdout.write('Berapa banyak : ');
      double inputJumlah = double.parse(stdin.readLineSync()!);
      totalHarga = hitunganAwal(harga, inputJumlah);
      print('Total harga = $totalHarga');
      myList.add(totalHarga);
      stdout.writeln(totalHarga);
      break;
    default:
      print('Kode barang Salah');
  }
   print(myList);
  double total2 = 0;
  for (var i = 0; i < myList.length; i++) {
    total2 = total2 + myList[i];
  }
  print(total2);

  print('Pilih cara beli:');
  print('Bayar Tunai ? (y/n)');
  var caraBeli = stdin.readLineSync();
  switch (caraBeli) {
    case 'y':
    case 'Y':
      diskon = 0.1 * total2;
      print('Diskon : $diskon');
      break;
    case 'n':
    case 'N':
      diskon = 0;
      print('Diskon : $diskon');
      break;
    default:
      print('Input salah');
  }

  totalBayar = total2 - (diskon ?? 0);
  print('Total bayar adalah : $totalBayar');
}

void hapusData() {
  List<Map<String, dynamic>> daftarHarga = [
    {'kode': '01', 'nama': 'sabun', 'harga': '5000'},
    {'kode': '02', 'nama': 'sikat', 'harga': '8000'},
    {'kode': '03', 'nama': 'shampoo', 'harga': '15000'},
  ];
 for (var produk in daftarHarga) {
      print('Kode: ${produk['kode']}, Nama: ${produk['nama']}, Harga: ${produk['harga']}');
    }
  stdout.write('Masukkan kode produk yang akan dihapus: ');
  var kodeProduk = stdin.readLineSync();

  var produkIndex =
      daftarHarga.indexWhere((produk) => produk['kode'] == kodeProduk);

  if (produkIndex != -1) {
    print('\nProduk yang akan dihapus:');
    print('Kode: ${daftarHarga[produkIndex]['kode']}');
    print('Nama: ${daftarHarga[produkIndex]['nama']}');
    print('Harga: ${daftarHarga[produkIndex]['harga']}');

    daftarHarga.removeAt(produkIndex);

    print('\nProduk berhasil dihapus.');
    print('Daftar produk setelah penghapusan:');
    for (var produk in daftarHarga) {
      print('Kode: ${produk['kode']}, Nama: ${produk['nama']}, Harga: ${produk['harga']}');
    }
  } else {
    print('\nProduk dengan kode $kodeProduk tidak ditemukan.');
  }
}


void updateData() {
   List<Map<String, dynamic>> daftarHarga = [
    {'kode': '01', 'nama': 'sabun', 'harga': '5000'},
    {'kode': '02', 'nama': 'sikat', 'harga': '8000'},
    {'kode': '03', 'nama': 'shampoo', 'harga': '15000'},
  ];
  for (var produk in daftarHarga) {
      print('Kode: ${produk['kode']}, Nama: ${produk['nama']}, Harga: ${produk['harga']}');
    }
  print('Pilih produk yang akan diupdate berdasarkan kode:');
  stdout.write('Masukkan kode produk yang akan di update: ');
  var kodeProduk = stdin.readLineSync();

  var produkIndex =
      daftarHarga.indexWhere((produk) => produk['kode'] == kodeProduk);

  if (produkIndex != -1) {
    print('Produk yang akan diupdate: ${daftarHarga[produkIndex]}');

    stdout.write('Masukkan nama baru: ');
    var namaBaru = stdin.readLineSync();

    stdout.write('Masukkan harga baru: ');
    var hargaBaru = stdin.readLineSync();

    daftarHarga[produkIndex]['nama'] = namaBaru;
    daftarHarga[produkIndex]['harga'] = hargaBaru;

    print('Produk berhasil diupdate:');
    for (var produk in daftarHarga) {
      print('Kode: ${produk['kode']}, Nama: ${produk['nama']}, Harga: ${produk['harga']}');
    }
  } else {
    print('Produk dengan kode $kodeProduk tidak ditemukan.');
  }
}

void main(List<String> arguments) {
  double? diskon;
  var totalBayar;
  List<double> myList = [];

  List<Map<String, dynamic>> daftarHarga = [
    {'kode': '01', 'nama': 'sabun', 'harga': '5000'},
    {'kode': '02', 'nama': 'sikat', 'harga': '8000'},
    {'kode': '03', 'nama': 'shampoo', 'harga': '15000'},
  ];

  print('Daftar kode dan Harga Barang');
  for (var i = 0; i < daftarHarga.length; i++) {
    print(daftarHarga[i]);
  }

  bool kondisi = true;
  while (kondisi == true) {
    print(''' 
      Selamat datang di toko xyz, silahkan pilih menu: 
      1. Beli
      2. Hapus
      3. Update
    ''');
    stdout.write('Masukkan menu pilihan : ');
    var pilihanMenu = stdin.readLineSync();
    switch (pilihanMenu) {
      case '1':
        insertData(myList, daftarHarga);
        break;
      case '2':
        hapusData();
        break;
      case '3':
        updateData();
        break;
      default:
        kondisi = false;
    }

    print('Apakah ingin melakukan transaksi lain? (y/n)');
    var pilihan = stdin.readLineSync();
    kondisi = (pilihan == 'y' || pilihan == 'Y');
  }

 
}
