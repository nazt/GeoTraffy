package com.nazt

class Experiment {
	String name = '[Experiment #]'
	Integer total
    static constraints = {
		name(unique:true)
    }
}
