import 'dart:io';

listFiles() {
	Directory dir = Directory.current;;

	dir.list(recursive:false, followLinks: false).listen((FileSystemEntity entity){
		print(entity.path);
		});
}

readFile(String fileName) async {
	var file = new File(fileName);
	String contents;

	contents = await file.readAsString();
	print("All content: $contents");

	String description = contents.split(":")[0];
	print("Descrição: $description");
}

void main() {

	listFiles();
}