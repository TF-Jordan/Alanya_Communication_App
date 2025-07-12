import 'package:flutter/material.dart';
import '../../widgets/call_tile.dart';
import '../../models/call_model.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = CallModel.generateDummyCalls();

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        return CallTile(
          call: call,
          onTap: () {
            // Action pour rappeler
          },
        );
      },
    );
  }
}
