import 'dart:io';
import 'dart:async';

String a;
bool b = true;

play() async {
	await Process.run('mocp', []).then((ProcessResult results) {
    	print('Mocp server is running');
	});

	File music = new File('sons/clock.mp3');

	await Process.start('mocp', ['-l', music.path]).then((Process result) {
		print("Playing");
	});
}

onOffMonitor()  {
	while(b) {
		Process.run('xset', ['dpms', 'force', 'off']);
		Process.run('xset', ['dpms', 'force', 'on']);
	}
}

main() {
	new Future(() async {
		onOffMonitor();
		});

	a = stdin.readLineSync();
	b = false;
	// Future.wait(thread);
	// play();
}
