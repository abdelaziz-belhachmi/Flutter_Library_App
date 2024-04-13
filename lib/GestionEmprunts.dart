import 'package:flutter/material.dart';
import 'GestionLivres.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class Emprunt {
  final int? empruntId;
  final int bookId;
  final DateTime dateEmprunt;
  final DateTime dateRetour;

  Emprunt({
    this.empruntId,
    required this.bookId,
    required this.dateEmprunt,
    required this.dateRetour,
  });

   Map<String, dynamic> toMap() {
    return {
      'empruntId': empruntId,
      'bookId': bookId,
      'dateEmprunt': dateEmprunt.toIso8601String(),
      'dateRetour': dateRetour.toIso8601String(),
    };
  }

}

//create Table Emprunt in database
Future<void> createEmpruntTable(Database db) async {
  await db.execute('''
    CREATE TABLE Emprunt (
      empruntId INTEGER PRIMARY KEY AUTOINCREMENT,
      bookId INTEGER NOT NULL,
      dateEmprunt TEXT NOT NULL,
      dateRetour TEXT NOT NULL,
      FOREIGN KEY (bookId) REFERENCES Book(bookId)
    )
  ''');
}

