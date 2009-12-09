package com.nazt

class Experiment {
	static hasMany = [data:DataKeeper,solution:Solution]
    
	String name = '[Experiment #]'
	Integer total
	Integer totalInDict
	Date dateCreated
	Date lastUpdated	
    static constraints = {
		name(unique:true)
    }
	String toString()
	{
		name	
	}
}
