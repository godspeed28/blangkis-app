import '../models/product.dart';

final dummyProducts = <String, Product>{
  'p1': Product(
    id: 'p1',
    name: 'Blangkon Asli',
    description: 'Blangkon khas Desa Pakis, dibuat tangan oleh pengrajin lokal.',
    price: 120000,
    assetImage: 'assets/images/blangkon.png',
  ),
  'p2': Product(
    id: 'p2',
    name: 'Souvenir Batik',
    description: 'Souvenir batik motif tradisional, cocok untuk cinderamata.',
    price: 75000,
    assetImage: 'assets/images/batik.png',
  ),
  'p3': Product(
    id: 'p3',
    name: 'Peci Bordir',
    description: 'Peci bordir khas untuk acara adat dan resmi.',
    price: 45000,
    assetImage: 'assets/images/peci.png',
  ),
  'p4': Product(
    id: 'p4',
    name: 'Tas Anyaman Pandan',
    description: 'Tas anyaman dari daun pandan alami, ringan dan ramah lingkungan.',
    price: 95000,
    assetImage: 'assets/images/tas_pandan.png',
  ),
  'p5': Product(
    id: 'p5',
    name: 'Gantungan Kunci Kayu',
    description: 'Gantungan kunci ukiran kayu jati dengan motif khas Jawa Tengah.',
    price: 25000,
    assetImage: 'assets/images/gantungan_kunci.png',
  ),
  'p6': Product(
    id: 'p6',
    name: 'Topi Anyaman Bambu',
    description: 'Topi tradisional anyaman bambu, nyaman dipakai di luar ruangan.',
    price: 60000,
    assetImage: 'assets/images/topi_bambu.png',
  ),
};
