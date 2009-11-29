import org.nazt.lexto.*
class BootStrap {

     def init = { servletContext ->
		servletContext.lextoObj=new LongLexTo("SELFED DICT") 
     }
     def destroy = {
     }
} 