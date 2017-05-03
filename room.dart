import 'command.dart';

class Room {

	String _name;
	String _description;
	List<Command> _commandsList;
  
	Room(String name, String description, List<Command> options) {
		this._name = name;
		this._description = description;
		this._commandsList = options;
	}

	bool containsOption(String option) {
		for(Command c in this._commandsList) {
			if(c.getOption() == option)
				return true;
		}
		return false;
	}

	Command getCommand(String option) {
		if(this.containsOption(option)) {
			for(Command c in this._commandsList) {
				if(c.getOption() == option)
					return c;
			}
		}
		return null;
	}

	String getName() => this._name;

	String getDescription() => this._description;

	List<Command> getCommandsList() => this._commandsList;

}
