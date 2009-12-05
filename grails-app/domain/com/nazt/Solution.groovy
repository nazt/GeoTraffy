package com.nazt

class Solution {
	static belongsTo= [data:DataKeeper]
	String word
	Boolean found = false
    static constraints = {
	word(nullable:false,blank:false,unique:true)
	found()
    }
	String toString()
	{
		word
	}
}
		