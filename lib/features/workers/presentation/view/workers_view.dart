import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/theme_const.dart';
import '../../../../core/models/user.dart';

class WorkersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Discussions',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
          itemCount: fakeUsers.length,
          itemBuilder: (context, index) {
            final user = fakeUsers[index];
            return Card(
              color: Theme.of(context).colorScheme.surface,
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                  radius: 26,
                ),
                title: Text(user.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text('Aucun message récent',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6))),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.primary, size: 18),
                onTap: () {
                  GoRouter.of(context).push(kChatScreen, extra: user);
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              ),
            );
          },
        ),
      ),
    );
  }
}
