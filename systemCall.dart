import 'dart:io';

play() async {
	await Process.run('mocp', []).then((ProcessResult results) {
    	print('Mocp server is running');
	});

	File music = new File('sons/clock.mp3');

	await Process.start('mocp', ['-l', music.path]).then((Process result) {
		print("Playing");
	});
}

main() async {

	String homePath = '/home/';
	await Process.run('/bin/sh', ['-c', 'echo \$USER']).then((ProcessResult result) {
		homePath += result.stdout;
	});

	if(homePath.endsWith("\n")) {
		homePath = homePath.substring(0, homePath.length - 1);
	}

	print(homePath);

	Directory dir = new Directory(homePath);
	dir.exists().then((isThere) {
		isThere ? print('exists') : print('non-existent');
	});

	play();

	await Process.run('xset', ['dpms', 'force', 'off']);
	Process.run('xset', ['dpms', 'force', 'on']);
}