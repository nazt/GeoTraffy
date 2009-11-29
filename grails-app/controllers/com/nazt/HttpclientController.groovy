package com.nazt
import groovyx.net.http.*;

/*import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.Method.GET
import static groovyx.net.http.ContentType.TEXT
*/
class HttpclientController {

    def index = { 
	try {

	
		def http = new HTTPBuilder( 'http://203.185.97.45/~intern/nazt/lexitron.txt' )
		http.request(Method.GET,ContentType.TEXT) { req ->		
		  headers.'User-Agent' = 'Mozilla/5.0'

		  response.success = { resp, reader ->
		   /* assert resp.statusLine.statusCode == 200*/
		    println "My response handler got response: ${resp.statusLine}"
		    println "Response length: ${resp.headers.'Content-Length'}"
			render reader.getText()
		  }

 
		  response.'404' = { resp -> 
		    render 'Not found'
		  }
		}		
	}
	catch(Exception e) {
		render 'error'
	}

	}
}
