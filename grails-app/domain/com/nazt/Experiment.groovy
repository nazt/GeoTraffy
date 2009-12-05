package com.nazt

class Experiment {
	static hasMany = [data:DataKeeper]
    
	String name = '[Experiment #]'
	Integer total
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
