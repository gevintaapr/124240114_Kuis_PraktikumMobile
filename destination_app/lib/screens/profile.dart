import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  final VoidCallback onLogout;

  const Profile({super.key, required this.username, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: colors.surface,
                child: Icon(Icons.person, size: 38, color: colors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profil',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(color: colors.onPrimaryContainer),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      username,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colors.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                // Di Root, function _logout dikirim ke halaman Profile sebagai onLogout → di Profile, tombol logout memanggil onLogout → function _logout di Root berjalan dan mengarahkan ke halaman Login.
                onPressed: onLogout,
                tooltip: 'Logout',
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Informasi akun',
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.alternate_email, color: colors.primary),
                title: const Text('Username'),
                subtitle: Text(username),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
