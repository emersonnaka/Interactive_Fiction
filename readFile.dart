import 'dart:io';

class ReadFile {

	static Map _roomsMap = new Map();

	static Map listFiles() {
		Directory dir = new Directory('./historia');

		dir.list(recursive:false, followLinks: false).listen((FileSystemEntity entity){
			print(entity.path);
			readFile(entity.path);
			});

		return this._roomsMap;
	}

	static readFile(String fileName) async {
		var file = new File(fileName);
		String contents;

		contents = await file.readAsString();

		String description = contents.split(":")[0];
		print("Descrição: $description");
	}
}