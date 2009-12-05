package com.nazt

class Solution {
	static belongsTo= [data:DataKeeper,experiment:Experiment]
	String word
	Boolean found = false
    static constraints = {
	word(nullable:false,blank:false,unique:false)
	found()
    }
	String toString()
	{
		word
	}
}
		