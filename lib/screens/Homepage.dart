import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/sql operation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
  List<Map<String, dynamic>> noteFromDb = [];

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  void refreshData() async {
    final datas = await SQLHelper.readNotes();
    setState(() {
      noteFromDb = datas;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyNotes",
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : AnimationLimiter(
        child: ListView.builder(
          itemCount: noteFromDb.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        "${noteFromDb[index]['title']}",
                        style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(noteFromDb[index]['note']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showForm(noteFromDb[index]['id']);
                              },
                              icon: const Icon(Icons.edit, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteNote(noteFromDb[index]['id']);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade400,
        onPressed: () => showForm(null),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  final title = TextEditingController();
  final note = TextEditingController();

  void showForm(int? id) async {
    if (id != null) {
      final existingNote = noteFromDb.firstWhere((note) => note['id'] == id);
      title.text = existingNote['title'];
      note.text = existingNote['note'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id == null ? 'Add New Note' : 'Edit Note',
                style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                    hintText: "Title", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: note,
                decoration: const InputDecoration(
                    hintText: "Enter note", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await addNote();
                  } else {
                    await updateNote(id);
                  }
                  title.text = "";
                  note.text = "";
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Add Note' : 'Update Note'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blueAccent.shade400,
                ),
              )
            ],
          ),
        ));
  }

  Future addNote() async {
    await SQLHelper.createNote(title.text, note.text);
    refreshData();
  }

  Future<void> updateNote(int id) async {
    await SQLHelper.updateNote(id, title.text, note.text);
    refreshData();
  }

  void deleteNote(int id) async {
    await SQLHelper.deletenote(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Note Deleted")));
    refreshData();
  }
}
