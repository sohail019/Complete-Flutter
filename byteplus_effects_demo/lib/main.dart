import 'package:flutter/material.dart';
import 'room_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    home: LoginPage(),
  );
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _roomIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BytePlus Effects Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Join Video Room',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(
                labelText: 'Your User ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _roomIdController,
              decoration: InputDecoration(
                labelText: 'Room ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.meeting_room),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.video_call),
              label: Text('Join Room'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                final userId = _userIdController.text.trim();
                final roomId = _roomIdController.text.trim();

                if (userId.isEmpty || roomId.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter User ID and Room ID')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RoomScreen(userId: userId, roomId: roomId),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _roomIdController.dispose();
    super.dispose();
  }
}
