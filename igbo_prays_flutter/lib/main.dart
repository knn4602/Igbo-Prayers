import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/prayers.dart';

void main() {
  runApp(PrayerApp());
}

class PrayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekpere Igbo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: PrayerHome(),
    );
  }
}

class PrayerHome extends StatefulWidget {
  @override
  State<PrayerHome> createState() => _PrayerHomeState();
}

class _PrayerHomeState extends State<PrayerHome> {
  List<Prayer> prayers = [];
  bool isIgbo = true;

  @override
  void initState() {
    super.initState();
    loadPrayers();
  }

  Future<void> loadPrayers() async {
    final String jsonStr =
        await rootBundle.loadString('assets/json/prayers.json/basicprayers.json');
    final List<dynamic> data = json.decode(jsonStr);
    setState(() {
      prayers = data.map((e) => Prayer.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isIgbo ? 'Ekpere Igbo' : 'Catholic Prayers'),
        actions: [
          Switch(
            value: isIgbo,
            onChanged: (value) {
              setState(() {
                isIgbo = value;
              });
            },
            activeColor: Colors.white,
          )
        ],
      ),
      body: prayers.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                final prayer = prayers[index];
                return ListTile(
                  title: Text(isIgbo ? prayer.titleIgbo : prayer.titleEnglish),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PrayerDetail(prayer: prayer, isIgbo: isIgbo),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class PrayerDetail extends StatelessWidget {
  final Prayer prayer;
  final bool isIgbo;

  const PrayerDetail({required this.prayer, required this.isIgbo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(isIgbo ? prayer.titleIgbo : prayer.titleEnglish),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isIgbo ? prayer.textIgbo : prayer.textEnglish,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
