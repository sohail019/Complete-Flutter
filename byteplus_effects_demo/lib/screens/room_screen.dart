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
  List<String> _participants = [];
  int _blurIntensity = 60;

  // Add a map to store renderers for different streams
  final Map<String, RTCVideoRenderer> _renderers = {};

  @override
  void initState() {
    super.initState();
    _initializeUserSession();
    _joinRoom();
  }

  Future<void> _initializeUserSession() async {
    _userSession = await _sessionManager.createSession(widget.userId);

    // Create and initialize a renderer for the local stream
    final renderer = ByteplusVideoRenderer();
    await renderer.initialize();

    // When the stream is available, attach it to the renderer
    if (_userSession.outputStream != null) {
      renderer.attachStream(_userSession.outputStream!);
    } else {
      // Set up a listener to attach the stream when it becomes available
      // This is a simplified approach - you might need a more robust solution
      Future.delayed(Duration(seconds: 1), () {
        if (_userSession.outputStream != null) {
          renderer.attachStream(_userSession.outputStream!);
          setState(() {});
        }
      });
    }

    _renderers[widget.userId] = renderer;
    setState(() {});
  }

  Future<void> _joinRoom() async {
    // Simulate joining a room and getting participants
    // In a real app, this would involve server communication
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _participants = ['user1', 'user2', widget.userId];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room: ${widget.roomId}'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _showEffectsPanel(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _renderers.containsKey(widget.userId)
                    ? _buildParticipantsGrid()
                    : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantsGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _participants.length <= 2 ? 1 : 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: _participants.length,
      itemBuilder: (context, index) {
        final participantId = _participants[index];
        return _buildParticipantView(participantId);
      },
    );
  }

  Widget _buildParticipantView(String participantId) {
    // If this is the current user, show their stream
    if (participantId == widget.userId &&
        _renderers.containsKey(widget.userId)) {
      return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: RTCVideoRendererView(
                renderer: _renderers[widget.userId]!,
                objectFit: RTCVideoViewObjectFit.cover,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  participantId + ' (You)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // For other participants (in a real app, you'd get their streams)
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(participantId)),
    );
  }

  void _showEffectsPanel() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => EffectsPanel(
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
    // Clean up all renderers
    for (final renderer in _renderers.values) {
      renderer.dispose();
    }
    _renderers.clear();

    _sessionManager.removeSession(widget.userId);
    super.dispose();
  }
}

class EffectsPanel extends StatelessWidget {
  final int blurIntensity;
  final Function(double) onBlurChanged;

  const EffectsPanel({
    Key? key,
    required this.blurIntensity,
    required this.onBlurChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Video Effects',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          Text('Background Blur: $blurIntensity'),
          Slider(
            value: blurIntensity.toDouble(),
            min: 0,
            max: 100,
            divisions: 10,
            onChanged: onBlurChanged,
          ),

          // Add more effects controls here
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
