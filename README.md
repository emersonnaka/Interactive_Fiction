Programming Languages
====================

Project 1: Interactive fiction
------------------------------

O arquivo "trabalho 1.pdf" tem a especificação do trabalho em PORTUGUÊS!

Each step occurs in a room:
* room.dart

Each room has:
1. Room name to use in "key" command variable
2. Room description to show each step of game
3. Command list for the gamer to choose

Each room has several commands:
* command.dart

Each command has:
1. String option to compare with gamer input
2. Command description to show your next action
3. String key to select next room

The game implementation in:
* interactiveFiction.dart

It mount hash map after read each file in "historia" path. Then, the game start.

systemCall.dart has system call to play sounds in mocp and turn on/off monitor. And writeDot.dart write a dot file to generate a graph.

Student
-------
Emerson Yudi Nakashima
Academic at the Federal Technological University of Parana - Campo Mourão, PR, Brazil