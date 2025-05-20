import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/constants/theme_const.dart';
import '../../../../core/models/user.dart';

class WorkersView extends StatelessWidget {
  String title;

  WorkersView({required this.title});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('$title',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.kmainBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
          itemCount: fakeUsers.length,
          itemBuilder: (context, index) {
            final user = fakeUsers[index];
            return InkWell(
              onTap: () {
                GoRouter.of(context).push(kChatScreen, extra: user);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.avatarUrl ?? ''),
                      radius: 26,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Aucun message récent',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
