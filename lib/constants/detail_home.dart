class HouseDetail {
  final String cover;
  final String title;
  final String location;
  final int price;
  final String spesification;
  final String description;

  HouseDetail({
    required this.cover,
    required this.title,
    required this.location,
    required this.price,
    required this.spesification,
    required this.description,
  });
}

final List<HouseDetail> detailProducts = [
  HouseDetail(
    cover: 'assets/images/rumah1.jpg',
    title: 'Intan Residence',
    location: 'Jakarta Selatan',
    price: 1200000000,
    spesification: '3 Kamar Tidur, 2 Kamar Mandi, 1 Garasi',
    description:
        'Rumah minimalis dengan desain modern, lingkungan aman dan nyaman, dekat dengan fasilitas umum.',
  ),
  HouseDetail(
    cover: 'assets/images/rumah2.jpg',
    title: 'Villa Indah',
    location: 'Bandung',
    price: 950000000,
    spesification: '4 Kamar Tidur, 3 Kamar Mandi, Taman Luas',
    description:
        'Rumah bergaya klasik dengan taman yang luas, cocok untuk keluarga besar, akses mudah ke pusat kota.',
  ),
  HouseDetail(
    cover: 'assets/images/rumah3.jpg',
    title: 'Cluster Elite',
    location: 'Surabaya',
    price: 1500000000,
    spesification: '5 Kamar Tidur, 4 Kamar Mandi, Kolam Renang',
    description:
        'Rumah cluster eksklusif dengan fasilitas lengkap, keamanan 24 jam, lingkungan asri dan tenang.',
  ),
  HouseDetail(
    cover: 'assets/images/rumah4.jpg',
    title: 'Victoria Residece',
    location: 'Yogyakarta',
    price: 350000000,
    spesification: '2 Kamar Tidur, 1 Kamar Mandi, Carport',
    description:
        'Rumah subsidi dengan harga terjangkau, cocok untuk pasangan muda, lokasi strategis dekat kampus.',
  ),
  HouseDetail(
    cover: 'assets/images/rumah5.jpg',
    title: 'Ubud Village',
    location: 'Bali',
    price: 2500000000,
    spesification: '6 Kamar Tidur, 5 Kamar Mandi, View Pantai',
    description:
        'Rumah villa mewah dengan pemandangan pantai, fasilitas premium, cocok untuk investasi dan liburan.',
  ),
];
