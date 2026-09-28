import 'package:flutter/material.dart';

import '../root.dart';
import '../models/user.dart';

// login disini pake stateful karena dia bisa ubah data, bisa input.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  //_LoginPageState menyimpan data dan tampilan yang bisa berubah.
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (users.any(
      (user) => user.username == username && user.password == password,
    )) {
      setState(() {
        isLoggedin = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil!"),
          backgroundColor: Colors.green,
        ),
      );
      // Navigator ini kan yang melanjutkan ke halaman selanjutnya
      // pushReplacement() mengganti halaman aktif dengan halaman baru tanpa menambah stack. Halaman sebelumnya akan dihapus dan diganti dengan halaman baru, sehingga tidak bisa kembali ke halaman sebelumnya.

      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      Navigator.pushReplacement(
        //
        context,
        MaterialPageRoute(builder: (context) => Root(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login gagal: username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // void _logout() {
  //   setState(() {
  //     isLoggedin = false;
  //     _usernameController.clear();
  //     _passwordController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: colors.primaryContainer,
                      child: Icon(
                        Icons.place_rounded,
                        size: 34,
                        color: colors.primary,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "TravelMyU",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),

                    const SizedBox(height: 28),
                    _usernameField(_usernameController),
                    const SizedBox(height: 16),
                    _passwordField(_passwordController),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController usernameController) {
  return SizedBox(
    width: 300,
    child: TextField(
      controller: usernameController,
      enabled: true,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Masukkan username",
        prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

Widget _passwordField(TextEditingController passwordController) {
  return SizedBox(
    width: 300,
    child: TextField(
      controller: passwordController,
      enabled: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Masukkan password",
        prefixIcon: const Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
