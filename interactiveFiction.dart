import 'dart:io';
import 'dart:async';
import 'room.dart';
import 'command.dart';
import 'writeDot.dart';
import 'systemCall.dart';

class InteractiveFiction {

	Map _roomsMap;
	final String firstRoom = 'introducaoAlgoritmos';
	
	InteractiveFiction() {
		this._roomsMap = new Map<String, Room>();
		WriteDot.createDot();
		this._listFiles();
	}

	void _listFiles() {
		Directory dir = new Directory('./historia');

		dir.list(recursive:false, followLinks: false).listen((FileSystemEntity entity) {
			this._readFile(entity.path);
			});
		// WriteDot.endDot();
	}

	Future _readFile(String fileName) async {
		String contents;
		String name;
		String description;
		String commandsSet;
		List<Command> commandList = new List<Command>();

		File file = new File(fileName);
		contents = await file.readAsStringSync();

		name = contents.split('\n')[0].trim();
		description = contents.split('\n')[1].trim();
		for(int i = 2; i < contents.split('\n').length; i++) {
			commandsSet = contents.split('\n')[i].trim();
			commandList.add(parseCommand(commandsSet));
		}
		Room room = new Room(name, description, commandList);
		WriteDot.insertRoomDot(room);
		this._roomsMap[name] = room;
	}

	Command parseCommand(String commandsSet) {
		String option = commandsSet.split('#')[0].trim();
		String command = commandsSet.split('#')[1].trim();
		String key;
		Command c;
		if(commandsSet.split('#').length == 3) {
			key = commandsSet.split('#')[2].trim();
			c = new Command(option, command, key);
		} else {
			c = new Command(option, command);
		}
		return c;
	}

	void initGame() {
		print('Agora que você completou o ensino médio, chegou a hora de encarar a faculdade. Enquanto uns dizem que é a melhor época da vida, por conta das festas que sempre tem. Outros ralam muito pra poder completar a gradução no tempo normal. Você tornou-se estudante do curso de Ciências da Computação, com duração de 4 anos. Teu objetivo é graduar-se sem reprovar em nenhuma matéria. Os professores estão lá para te ensinar e, também, cobrar muito de você. Sem contar as situações inusitadas que podem acontecer.\nPressione Enter para começar o jogo e a cada descrição da sala.');
		stdin.readLineSync();
		print('\n');		
		runGame();
	}

	void runGame() {
		Room currentRoom = this._roomsMap[firstRoom];
		String option;

		while(currentRoom.getName() != 'gameOver' && currentRoom.getName() != 'parabens') {
			print(currentRoom.getDescription());
			
			if(currentRoom.getName() == 'p1logica') {
				print('entrou');
				SystemCall.playLaugh();
			}

			stdin.readLineSync();
			List<Command> commandList = currentRoom.getCommandsList();
			for(Command c in commandList) {
				print('${c.getOption()} - ${c.getResult()}');
			}

			// if(currentRoom.getName().substring(0, 1) == 'p') {
			// 	print("TOCA");
			// 	SystemCall.playClock();
			// }

			print('Opção: ');
			option = stdin.readLineSync().toUpperCase();
			if(currentRoom.containsOption(option)) {
				Command c = currentRoom.getCommand(option);
				if(c.hasKey()) {
					currentRoom = this._roomsMap[c.getKey()];
				}
			}

			if(currentRoom.getName() == 'gameOver') {
				SystemCall.playGameOver();
				print(currentRoom.getDescription());
			} else if(currentRoom.getName() == 'parabens') {
				SystemCall.playApplause();
				print(currentRoom.getDescription());
			}
			//  else if(currentRoom.getName() == 'p1logica') {
			// 	SystemCall.playLaugh();
			// }
		}
	}

	// void descriptionSound(String nameRoom) {
	// 	if(nameRoom == 'p1logica') {
			
	// 	} else if(nameRoom == 'p2algoritmo') {
	// 		SystemCall.playStorm();
	// 		SystemCall.onOffMonitor();
	// 	}
	// }

	// void optionSound(String nameRoom) {
	// 	if(nameRoom.substring(0, 1) == 'p') {
	// 		SystemCall.playClock();
	// 		print('Era pra estar tocando');
	// 	}
	// }

	Map getRoomsMap() => this._roomsMap;
}


main() async {

	InteractiveFiction runGame =  await new InteractiveFiction();
	await SystemCall.openMocp();
	runGame.initGame();

	// await SystemCall.closeMocp();
}