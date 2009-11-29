package com.nazt

class LexToDict {
	String vocaburary
	Date dateCreated
	
    static constraints = {
		vocaburary(nullable:false,unique:true,blank:false)
		dateCreated()
    }
}
