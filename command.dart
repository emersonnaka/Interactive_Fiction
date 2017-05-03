class Command {
  
	String _option;
	String _result;
	String _key;

	Command(String option, String result, [String key]) {
		this._option = option;
		this._result = result;
		if(key != null)
			this._key = key;
	}

	bool hasKey() {
		if(this._key != null)
			return true;
		return false;
	}

	String getOption() => this._option;

	String getResult() => this._result;

	String getKey() => this._key;
}
