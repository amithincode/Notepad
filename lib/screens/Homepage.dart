import 'package:flutter/material.dart';

import '../services/sql operation.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
  List<Map<String, dynamic>> note_from_db = [];

  @override
  void initState() {
    // refreshing the ui
    refreshData();
    super.initState();
  }

  void refreshData() async {
    final datas = await SQLHelper.readNotes();
    setState(() {
      note_from_db = datas;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                ),
              ),
            );
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
        ),
      ),
    );
  }

  final title = TextEditingController();
  final note = TextEditingController();

  void showForm(int? id) async {
    if (id != null) {
      final existingNote = note_from_db.firstWhere((note) => note['id'] == id);
      title.text = existingNote['title'];
      note.text = existingNote['note'];
    }

    showModalBottomSheet(
        context: context,
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
              TextField(
                controller: title,
                decoration: const InputDecoration(
                    hintText: "Title", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: note,
                decoration: const InputDecoration(
                    hintText: "Enter note", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await addNote();
                  }
                  if (id != null) {
                    await updateNote(id);
                  }
                  title.text = "";
                  note.text = "";
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'ADD NOTE' : "UPDATE"),
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

