import 'package:flutter/material.dart';

class KprPage extends StatefulWidget {
  const KprPage({super.key});

  @override
  State<KprPage> createState() => _KprPageState();
}

class _KprPageState extends State<KprPage> {
  final _hargaController = TextEditingController();
  final _dpController = TextEditingController();
  final _tenorController = TextEditingController();

  double? hasilCicilan;

  void hitungKPR() {
    final harga = double.tryParse(_hargaController.text) ?? 0;
    final dp = double.tryParse(_dpController.text) ?? 0;
    final tenor = int.tryParse(_tenorController.text) ?? 0;

    final pinjaman = harga - dp;
    final jumlahBulan = tenor * 12;

    if (pinjaman > 0 && jumlahBulan > 0) {
      setState(() {
        hasilCicilan = pinjaman / jumlahBulan;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: const Text(
                'Kalkulator KPR',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Text(
                'Hitung pembayaran KPR Anda dan jelajahi opsi KPR yang sesuai dengan rumah impian Anda.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Harga Rumah",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _dpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Uang Muka (DP)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tenorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tenor (tahun)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungKPR,
              child: const Text("Hitung Cicilan"),
            ),
            const SizedBox(height: 20),
            if (hasilCicilan != null)
              Text(
                "Cicilan per bulan: Rp ${hasilCicilan!.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
