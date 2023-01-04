import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Audio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Live Audio')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => jumpToLivePage(
                    context,
                    roomID: '1234',
                    isHost: true,
                  ),
                  child: const Text('Start live'),
                ),
                ElevatedButton(
                  onPressed: () => jumpToLivePage(
                    context,
                    roomID: '4567',
                    isHost: false,
                  ),
                  child: const Text('Watch live'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  jumpToLivePage(BuildContext context,
      {required String roomID, required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LiveAudioPage(
          roomID: roomID,
          isHost: isHost,
        ),
      ),
    );
  }
}

class LiveAudioPage extends StatelessWidget {
  final String roomID;
  final bool isHost;

  const LiveAudioPage({Key? key, required this.roomID, this.isHost = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID:
            1489720213, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            "75b4e4fdb0bc4a92363c6333f77b4b5ce0ba68d5fefbefc79f7823ef1d42ab45", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'darkwa_01',
        userName: 'codewithdarkwa',
        roomID: roomID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
      ),
    );
  }
}
