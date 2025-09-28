import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nusacodes_final_project/constants/detail_home.dart';
import 'package:nusacodes_final_project/constants/my_color.dart';

class KprPage extends StatefulWidget {
  const KprPage({super.key});

  @override
  State<KprPage> createState() => _KprPageState();
}

class _KprPageState extends State<KprPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _hargaController = TextEditingController();
  final _dpController = TextEditingController();
  int? selectedTenor;
  HouseDetail? selectedHouse;

  double? hasilCicilan;

  void hitungKPR() {
    if (!_formKey.currentState!.validate()) return;
    final hargaRumah = selectedHouse!.price.toDouble();
    final dp = double.tryParse(_dpController.text) ?? 0;
    final tenor = selectedTenor ?? 0;

    final pinjaman = hargaRumah - dp;
    final bulan = tenor * 12;

    // Anggap bunga fix 10% per tahun
    final bunga = 0.1 / 12;
    final cicilan = (pinjaman * bunga) / (1 - (1 / (pow(1 + bunga, bulan))));

    setState(() {
      hasilCicilan = cicilan;
    });
  }

  @override
  void dispose() {
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Kalkulator KPR',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hitung pembayaran KPR Anda dan jelajahi opsi KPR yang sesuai dengan rumah impian Anda.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Dropdown pilih rumah
              DropdownButtonFormField<HouseDetail>(
                decoration: const InputDecoration(
                  labelText: "Pilih Rumah",
                  border: OutlineInputBorder(),
                ),
                value: selectedHouse,
                items: detailProducts.map((house) {
                  return DropdownMenuItem(
                    value: house,
                    child: Text(house.title),
                  );
                }).toList(),
                onChanged: (house) {
                  setState(() {
                    selectedHouse = house;
                    _hargaController.text = formatCurrency(house!.price);
                  });
                },
                validator: (value) => value == null ? "Pilih rumah dulu" : null,
              ),
              const SizedBox(height: 16),

              // Harga rumah (read-only)
              TextFormField(
                controller: _hargaController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Harga Rumah",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Harga kosong" : null,
              ),
              const SizedBox(height: 12),

              // Uang muka
              TextFormField(
                controller: _dpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Uang Muka (DP)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan DP" : null,
              ),
              const SizedBox(height: 12),

              // Dropdown tenor
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  labelText: "Tenor (tahun)",
                  border: OutlineInputBorder(),
                ),
                value: selectedTenor,
                items: const [
                  DropdownMenuItem(value: 15, child: Text("15 Tahun")),
                  DropdownMenuItem(value: 20, child: Text("20 Tahun")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedTenor = value;
                  });
                },
                validator: (value) => value == null ? "Pilih tenor dulu" : null,
              ),
              const SizedBox(height: 16),

              // Tombol hitung
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: MyColor.bluePrimary,
                ),
                onPressed: hitungKPR,
                child: const Text(
                  "Hitung Cicilan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Cicilan per bulan",
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text: hasilCicilan != null
                      ? formatCurrency(hasilCicilan!.round())
                      : "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatCurrency(int number) {
  return 'Rp ${number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
}
