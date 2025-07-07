import 'package:flutter/material.dart';
import 'package:byteplus_rtc/byteplus_rtc.dart';
import '../session_manager.dart';

class RoomScreen extends StatefulWidget {
  final String roomId;
  final String userId;

  const RoomScreen({Key? key, required this.roomId, required this.userId})
    : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final SessionManager _sessionManager = SessionManager();
  late UserSession _userSession;
  List<int> _remoteUserIds = [];
  int _blurIntensity = 60;

  @override
  void initState() {
    super.initState();
    _initializeSessionAndJoin();
  }

  Future<void> _initializeSessionAndJoin() async {
    _userSession = await _sessionManager.createSession(widget.userId);

    final rtcEngine = _userSession.rtcEngine;

    rtcEngine.onUserJoined = (uid, elapsed) {
      setState(() {
        _remoteUserIds.add(uid);
      });
    };

    rtcEngine.onUserOffline = (uid, reason) {
      setState(() {
        _remoteUserIds.remove(uid);
      });
    };

    await rtcEngine.joinChannel(
      token: 'YOUR_TOKEN',
      channelId: widget.roomId,
      uid: int.parse(widget.userId),
    );

    // Apply effects
    _userSession.setBlurEffect(_blurIntensity);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room: ${widget.roomId}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showEffectsPanel,
          ),
        ],
      ),
      body: _buildVideoGrid(),
    );
  }

  Widget _buildVideoGrid() {
    final participants =
        [widget.userId] + _remoteUserIds.map((e) => e.toString()).toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: participants.length <= 2 ? 1 : 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final participantId = participants[index];

        if (participantId == widget.userId) {
          return _buildLocalView();
        } else {
          return _buildRemoteView(int.parse(participantId));
        }
      },
    );
  }

  Widget _buildLocalView() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: RTCVideoViewLocal(
              rtcEngine: _userSession.rtcEngine,
              objectFit: RTCVideoViewObjectFit.cover,
            ),
          ),
          _buildNameLabel('${widget.userId} (You)'),
        ],
      ),
    );
  }

  Widget _buildRemoteView(int uid) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: RTCVideoViewRemote(
              rtcEngine: _userSession.rtcEngine,
              uid: uid,
              objectFit: RTCVideoViewObjectFit.cover,
            ),
          ),
          _buildNameLabel('User $uid'),
        ],
      ),
    );
  }

  Widget _buildNameLabel(String name) {
    return Positioned(
      bottom: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void _showEffectsPanel() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => EffectsPanel(
            blurIntensity: _blurIntensity,
            onBlurChanged: (value) {
              setState(() {
                _blurIntensity = value.toInt();
                _userSession.setBlurEffect(_blurIntensity);
              });
            },
          ),
    );
  }

  @override
  void dispose() {
    _sessionManager.removeSession(widget.userId);
    super.dispose();
  }
}

class EffectsPanel extends StatelessWidget {
  final int blurIntensity;
  final ValueChanged<double> onBlurChanged;

  const EffectsPanel({
    Key? key,
    required this.blurIntensity,
    required this.onBlurChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Video Effects',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text('Background Blur: $blurIntensity'),
          Slider(
            value: blurIntensity.toDouble(),
            min: 0,
            max: 100,
            divisions: 10,
            onChanged: onBlurChanged,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
