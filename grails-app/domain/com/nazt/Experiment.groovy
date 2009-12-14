package com.nazt

class Experiment {
	static hasMany = [data:DataKeeper,solution:Solution]
    
	String name = '[Experiment #]'
	Integer total
	Integer totalInDict
	Date dateCreated
	Date lastUpdated	
	Float correctness=0
    static constraints = {
		name(unique:true)
    }
	String toString()
	{
		name	
	}
}
