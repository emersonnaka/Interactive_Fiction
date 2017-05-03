import 'dart:io';

class SystemCall {

	static openMocp() async {
		await Process.run('mocp', ['-S']).then((ProcessResult resultadoProcesso) {
			print('Executando servidor do mocp');
			});
	}

	static closeMocp() async {
		await Process.run('mocp', ['-x']);
	}

	static playClock() async {
		File music = new File('sons/clock.mp3');
		await Process.start('mocp', ['-l', music.path]);
	}

	static playGameOver() async {
		File music = new File('sons/gameOver.wav');
		await Process.start('mocp', ['-l', music.path]);
	}

	static playLaugh() async {
		File music = new File('sons/hahaha.mp3');
		await Process.start('mocp', ['-l', music.path]);	
	}

	static playStorm() async {
		File music = new File('sons/storm.wav');
		await Process.start('mocp', ['-l', 'Repeat', music.path]);
	}

	static pause() async {
		await Process.start('mocp', ['-P']);
	}

	static onOffMonitor() async {
		await Process.run('xset', ['dpms', 'force', 'off']);
		await Process.run('xset', ['dpms', 'force', 'on']);
		await Process.run('xset', ['dpms', 'force', 'off']);
		await Process.run('xset', ['dpms', 'force', 'on']);
	}

}