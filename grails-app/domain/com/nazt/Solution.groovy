package com.nazt

class Solution {
	static belongsTo= [data:DataKeeper]
	String word
	Boolean found = false
    static constraints = {
	word()
	found()
    }
	String toString()
	{
		word
	}
}
