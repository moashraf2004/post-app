import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            accountName: Text(
                "Mohamed Ashraf",
              style: GoogleFonts.acme(
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
                "mohamedashraf3680@gmail.com",
              style: GoogleFonts.acme(
                fontSize: 15,
              )
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                    "assets/3shroof.jpg",
                  fit: BoxFit.cover,
                  height: 120,
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
