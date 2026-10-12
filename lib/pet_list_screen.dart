import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop4_22_195/add_pet_screen.dart';
import 'package:workshop4_22_195/pet_model.dart';

class PetListScreen extends StatefulWidget {
  const PetListScreen({super.key});

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "รายการสัตว์เลี้ยง",
          style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: petList.length,
        itemBuilder: (context, index) {
          final pet = petList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.pets, color: Colors.teal),
              ),
              title: Text(
                pet.name,
                style: GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "พันธุ์: ${pet.breed} (${pet.petType.typeName})",
                style: GoogleFonts.kanit(fontSize: 14),
              ),
              trailing: Text(
                "${pet.age} ปี",
                style: GoogleFonts.kanit(fontSize: 16, color: Colors.teal),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPetScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}