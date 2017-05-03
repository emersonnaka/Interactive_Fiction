import 'dart:io';
import 'dart:core';
import 'room.dart';
import 'command.dart';

class WriteDot{

	static final String HEADER = 'digraph g {\ngraph [\nrankdir = "LR"\n];\nnode [\nfontsize = "16"\nshape = "ellipse"\n];\nedge [\n];\n';
	static final String OPENLABEL = 'label = ';
	static final String F0 = '\"<f0> ';
	static final String F1 = ' | <f1> ';
	static final String F2 = ' | <f2> ';
	static final String F3 = ' | <f3> ';
	static final String CLOSELABEL = '\"\n';
	static final String SHAPE = 'shape = \"record\"\n];';
	static final String END = '}';

	static File file = new File('graph.dot');
	static int i = 0;

	static createDot() {
		if (!file.existsSync()) {
			file.createSync();
		}
		file.writeAsStringSync(HEADER);
	}

	static endDot() {
		file.writeAsStringSync(END, mode: FileMode.APPEND);
	}

	static insertRoomDot(Room room) {
		String pointer = '';

		String buffer = '\n\"${room.getName()}\" [\n$OPENLABEL';
		buffer += '$F0' '${room.getName()}';
		for(Command c in room.getCommandsList()) {
			String result = cutDot(c.getResult());
			if(c.getOption() == 'A') {
				buffer += '$F1' '$result';
				if(c.hasKey()) {
					pointer += '\n\"${room.getName()}\":f1 -> \"${c.getKey()}\":f0 [\nid = $i\n];';
					i++;
				}
			} else if(c.getOption() == 'B') {
				buffer += '$F2' '$result';
				if(c.hasKey()) {
					pointer += '\n\"${room.getName()}\":f2 -> \"${c.getKey()}\":f0 [\nid = $i\n];';
					i++;
				}
			} else if(c.getOption() == 'C') {
				buffer += '$F3' '$result';
				if(c.hasKey()) {
					pointer += '\n\"${room.getName()}\":f3 -> \"${c.getKey()}\":f0 [\nid = $i\n];';
					i++;
				}
			}
		}
		buffer += '$CLOSELABEL';
		buffer += '$SHAPE';
		buffer += pointer;
		file.writeAsStringSync(buffer, mode: FileMode.APPEND);
	}

	static String cutDot(String description) {
		if(description.length >= 30) {
			String buffer = description.substring(0, 30);
			buffer = buffer.substring(0, buffer.lastIndexOf(' '));
			return buffer.toString().trim();
		} else {
			return description;
		}
	}
}