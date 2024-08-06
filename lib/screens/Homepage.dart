import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/sql operation.dart';

=======

import '../services/sql operation.dart';



>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
<<<<<<< HEAD
  List<Map<String, dynamic>> noteFromDb = [];

  @override
  void initState() {
=======
  List<Map<String, dynamic>> note_from_db = [];

  @override
  void initState() {
    // refreshing the ui
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
    refreshData();
    super.initState();
  }

  void refreshData() async {
    final datas = await SQLHelper.readNotes();
    setState(() {
<<<<<<< HEAD
      noteFromDb = datas;
=======
      note_from_db = datas;
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        title:  Text(
          "MyNotes",
          style: TextStyle(fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent.shade400,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: note_from_db.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${note_from_db[index]['title']}"),
                subtitle: Text(note_from_db[index]['note']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showForm(note_from_db[index]['id']);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteNote(note_from_db[index]['id']);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
                  ),
                ),
              ),
            );
<<<<<<< HEAD
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade400,
        onPressed: () => showForm(null),
        child: const Icon(
          Icons.add,
          color: Colors.white,
=======
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => showForm(null),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
        ),
      ),
    );
  }

  final title = TextEditingController();
  final note = TextEditingController();

  void showForm(int? id) async {
    if (id != null) {
<<<<<<< HEAD
      final existingNote = noteFromDb.firstWhere((note) => note['id'] == id);
=======
      final existingNote = note_from_db.firstWhere((note) => note['id'] == id);
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
      title.text = existingNote['title'];
      note.text = existingNote['note'];
    }

    showModalBottomSheet(
        context: context,
<<<<<<< HEAD
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
=======
        elevation: 3,
        isScrollControlled: true,
        builder: (context) => Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
              TextField(
                controller: title,
                decoration: const InputDecoration(
                    hintText: "Title", border: OutlineInputBorder()),
              ),
<<<<<<< HEAD
              const SizedBox(height: 10),
=======
              const SizedBox(
                height: 10,
              ),
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
              TextField(
                controller: note,
                decoration: const InputDecoration(
                    hintText: "Enter note", border: OutlineInputBorder()),
              ),
<<<<<<< HEAD
              const SizedBox(height: 10),
=======
              const SizedBox(
                height: 10,
              ),
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await addNote();
<<<<<<< HEAD
                  } else {
=======
                  }
                  if (id != null) {
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
                    await updateNote(id);
                  }
                  title.text = "";
                  note.text = "";
                  Navigator.of(context).pop();
                },
<<<<<<< HEAD
                child: Text(id == null ? 'Add Note' : 'Update Note'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blueAccent.shade400,
                ),
=======
                child: Text(id == null ? 'ADD NOTE' : "UPDATE"),
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
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
<<<<<<< HEAD
=======

>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
