import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop4_22_195/pet_model.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _breed = '';
  int _age = 0;
  PetType _petType = PetType.dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพิ่มข้อมูลสัตว์เลี้ยง",
          style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // 1. ชื่อสัตว์เลี้ยง
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "ชื่อสัตว์เลี้ยง",
                    labelStyle: GoogleFonts.kanit(fontSize: 18),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      (val == null || val.isEmpty) ? "กรุณาป้อนชื่อสัตว์เลี้ยง" : null,
                  onSaved: (val) => _name = val!,
                ),
                const SizedBox(height: 16),

                // 2. สายพันธุ์
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "สายพันธุ์",
                    labelStyle: GoogleFonts.kanit(fontSize: 18),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      (val == null || val.isEmpty) ? "กรุณาป้อนสายพันธุ์" : null,
                  onSaved: (val) => _breed = val!,
                ),
                const SizedBox(height: 16),

                // 3. อายุ
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "อายุ (ปี)",
                    labelStyle: GoogleFonts.kanit(fontSize: 18),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      (val == null || val.isEmpty) ? "กรุณาป้อนอายุ" : null,
                  onSaved: (val) => _age = int.parse(val!),
                ),
                const SizedBox(height: 16),

                // 4. Dropdown ชนิดสัตว์เลี้ยง
                DropdownButtonFormField<PetType>(
                  value: _petType,
                  decoration: InputDecoration(
                    labelText: "ประเภทสัตว์เลี้ยง",
                    labelStyle: GoogleFonts.kanit(fontSize: 18),
                    border: const OutlineInputBorder(),
                  ),
                  items: PetType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.typeName, style: GoogleFonts.kanit()),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _petType = val!),
                ),
                const SizedBox(height: 24),

                // 5. ปุ่มบันทึก
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        petList.add(PetModel(
                          name: _name,
                          breed: _breed,
                          age: _age,
                          petType: _petType,
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "บันทึกข้อมูล",
                      style: GoogleFonts.kanit(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}