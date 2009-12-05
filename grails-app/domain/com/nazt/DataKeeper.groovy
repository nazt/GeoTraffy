package com.nazt

class DataKeeper {
	static belongsTo=[experiment:Experiment]
	static hasMany = [solution:Solution]
	String rawText
	String tokenizedText
	Date dateCreated
	Date lastUpdated	
    static constraints = {
		rawText()
		tokenizedText()
		dateCreated()
		lastUpdated()
    }

}
