import 'comando.dart';

class Sala {
  
	String description;
	List<Comando> options;
  
	Sala(String description, List<Comando> options) {
		this.description = description;
		this.options = options;
	}

	bool containsOption(String option) {
		for(Comando c in options) {
			if(c.option == option)
				return true;
		}
		return false;
	}

	Comando getComando(String option) {
		if(this.containsOption(option)) {
			for(Comando c in options) {
				if(c.option == option)
					return c;
			}
		}
		return null;
	}

}
