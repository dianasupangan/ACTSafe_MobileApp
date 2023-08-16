import 'dart:collection';
import 'dart:convert';

import 'package:actsafe/global/drawer.dart';
import 'package:actsafe/screen/home/components/qr_widget.dart';
import 'package:actsafe/utils/covid_status.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/api_key.dart';
import '../../global/link_header.dart';
import '../../utils/snackbar_helper.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  late SharedPreferences prefs;
  String userUuid = "";

  @override
  void initState() {
    // flutterBlue.startScan(timeout: const Duration(seconds: 4));
    // startScan();
    // newDeviceUuid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              alignment: Alignment.center,
              child: const QR_Widget(),
            ),
            const CovidStatusWidget(),
          ],
        ),
      ),
    );
  }

  void newDeviceUuid() async {
    prefs = await SharedPreferences.getInstance();
    final json = jsonDecode(prefs.getString('user_data')!) as Map;

    final AdvertiseData advertiseData = AdvertiseData(
      serviceUuid: json['device_id'].toString(),
    );
    print(json['device_id'].toString());
    final AdvertiseSettings advertiseSettings = AdvertiseSettings(
      advertiseMode: AdvertiseMode.advertiseModeBalanced,
      txPowerLevel: AdvertiseTxPower.advertiseTxPowerMedium,
      timeout: 3000,
    );
    final AdvertiseSetParameters advertiseSetParameters =
        AdvertiseSetParameters();

    await FlutterBlePeripheral().start(
      advertiseData: advertiseData,
      advertiseSetParameters: advertiseSetParameters,
    );
  }

  void startScan() async {
    var subscription = flutterBlue.scanResults.listen(
      (results) {
        for (ScanResult r in results) {
          if (r.rssi >= -60 &&
              r.advertisementData.serviceUuids.toString().length > 3) {
            uploadScannedDevices(
                r.advertisementData.serviceUuids.toList().join().toString());
            print(r.advertisementData.serviceUuids.toList().join().toString());
          }
        }
        Future.delayed(Duration(seconds: 2));
      },
    );
  }

  void uploadScannedDevices(String deviceUuid) async {
    prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('user_data')!) as Map;

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_save_ble_uuids",
        "api_key": apiKey(),
        "id_number": userData['id_number'].toString(),
        "device_uuid": deviceUuid,
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];

      if (result == 'Success') {
        print('Success');
      } else if (result == 'Failed') {
        print("Fail");
      }
    } catch (err) {
      // showErrorMessage(context, message: "Connection Error");
      print(err);
    }
  }
}
