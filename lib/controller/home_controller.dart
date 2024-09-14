import 'dart:typed_data';
import 'package:car/core/constant/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isHideText = false;
  BluetoothConnection? connection;
  double turn = 0;
  void connectToDevice() async {
    try {
      BluetoothDevice? targetDevice;
      List<BluetoothDevice> devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();

      for (BluetoothDevice device in devices) {
        if (device.name == 'name') {
          targetDevice = device;
          break;
        }
      }

      if (targetDevice != null) {
        connection = await BluetoothConnection.toAddress(targetDevice.address);
        print('Connected to the device');
      }
    } catch (e) {
      print('Cannot connect, exception occurred');
    }
  }

  logoRotate() {
    isHideText = true;
    update();
    turn++;
    update();
    Future.delayed(const Duration(seconds: 3), () {
      isHideText = false;
      update();
    });
  }

  bool isLock = true;
  isLockChange() {
    isLock = !isLock;
    update();
  }

  List icon;

  HomeController() : icon = [] {
    icon = [
      {
        "icon": SvgPicture.asset(Img.trumbet),
        "onTap": () {
          sendData("trumbet");
        }
      },
      {
        "icon": Transform.scale(scale: 3.3, child: SvgPicture.asset(Img.car)),
        "onTap": () {}
      },
      {
        "icon": SvgPicture.asset(Img.light),
        "onTap": () {
          sendData("light");
        }
      },
      {
        "icon": SvgPicture.asset(Img.turnLigt),
        "onTap": () {
          sendData("turnLight");
        }
      },
    ];
  }
  @override
  void onInit() {
    connectToDevice();
    super.onInit();
  }

  @override
  void dispose() {
    connection?.dispose();
    super.dispose();
  }

  void sendData(String data) async {
    connection?.output.add(Uint8List.fromList(data.codeUnits));
    await connection?.output.allSent;
  }
}
