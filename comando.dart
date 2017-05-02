class Comando {
  
	String option;
	String result;
	String key;

	Comando(String comando, String result, [String key]) {
		this.option = option;
		this.result = result;
		this.key = key;
	}

	bool hasKey() {
		if(this.key != null)
			return true;
		return false;
	}

}
