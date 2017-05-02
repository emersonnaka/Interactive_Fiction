import 'dart:core';
import 'sala.dart';
import 'comando.dart';

void main() {
  
	Sala entrada = new Sala("Você abre os olhos e vê uma porta aberta...",
		             [new Comando("Entrar na porta", "Você passou pela porta", "primeira_sala"),
		             new Comando("Abrir o portão dos fundos", "A maçaneta está quebrada"),
		             new Comando("Seguir para o jardim", "Você encontra um jardim morto", "jardim")]);

	Sala primeira_sala = new Sala("Ao abrir a porta você se depara com uma estátua...",
		                    [new Comando("Voltar à primeira sala", "A porta fechou-se e você não consegue voltar"),
		                     new Comando("Empurrar estátua", "É muito pesada para sair do lugar"),
		                     new Comando("Pressionar botão", "Uma porta se abriu na parede e você seguiu por ela",
		                                 "primeira_sala")]);

	Map salas = {
		"entrada" : entrada,
		"primeira_sala" : primeira_sala,
	};

	Sala salaAtual = salas['entrada'];
	String op = 'Entrar na porta';

	if(salaAtual.containsOption(op)) {
		Comando c = salaAtual.getComando(op);
		if(c.hasKey()) {
			salaAtual = salas[c.key];
			print("Você está na ${c.key}");
		} else {
			print("Este comando não possui uma chave");
		}
	} else {
		print("A opção \'${op}\' não existe");
	}
}
