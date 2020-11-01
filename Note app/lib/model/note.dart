class Note {
  final String noteTitle;
  final String noteContent;
  final String courseName;

  Note({
    this.noteTitle,
    this.noteContent,
    this.courseName,
  });

  Map toMap(Note note) {
    return {
      'title': note.noteTitle,
      'content': note.noteContent,
      'course': note.courseName
    };
  }
}
