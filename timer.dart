import 'dart:async';

void handleTimeout() {  // callback function
		print("Teste");
}

void main() {
	const TIMEOUT = const Duration(seconds: 3);
	const ms = const Duration(milliseconds: 1);

	Timer test = new Timer(TIMEOUT, handleTimeout);
	
}