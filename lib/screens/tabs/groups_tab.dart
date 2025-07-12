import 'package:flutter/material.dart';
import '../group_chat_screen.dart';
import '../group_details_screen.dart';
import '../../widgets/group_tile.dart';
import '../../models/group_model.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = GroupModel.generateDummyGroups();

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return GroupTile(
          group: group,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupChatScreen(group: group),
              ),
            );
          },
          onDetailsPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupDetailsScreen(group: group),
              ),
            );
          },
        );
      },
    );
  }
}