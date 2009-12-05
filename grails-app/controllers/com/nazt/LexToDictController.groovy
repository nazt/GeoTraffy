package com.nazt
import groovyx.net.http.*;
class LexToDictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [lexToDictInstanceList: LexToDict.list(params), lexToDictInstanceTotal: LexToDict.count()]
    }
	def remote = { }
	def getRemoteFile = { 
		try {
			def http = new HTTPBuilder( params.url)
			http.request(Method.GET,ContentType.TEXT) { req ->		
			  headers.'User-Agent' = 'Mozilla/5.0'

			  response.success = { resp, reader ->
			    println "My response handler got response: ${resp.statusLine}"
			    println "Response length: ${resp.headers.'Content-Length'}"
				reader.getText().eachLine{    
					try {
							new LexToDict(vocaburary:it.toString().trim()).save() 
						servletContext.lextoObj.addDict(it.toString().trim())
						} 
					catch(Exception e) {
						println 'exception caught !'
						println e
					}
				}
 			}
			  response.'404' = { resp -> 
			    render 'Not found'
			  }
			}		
		}
		catch(Exception e) {
			flash.defaultMessage = "book deleted"
            redirect(action: "remote")
		}
			println 'end ja'
		redirect(action:"list")
		 }
    def create = {
        def lexToDictInstance = new LexToDict()
        lexToDictInstance.properties = params
        return [lexToDictInstance: lexToDictInstance]
    }

    def save = {
        def lexToDictInstance = new LexToDict(params)
        if (lexToDictInstance.save(flush: true)) {
		//	println params
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), lexToDictInstance.id])}"
			servletContext.lextoObj.addDict(params.vocaburary.trim())
            redirect(action: "show", id: lexToDictInstance.id)
        }
        else {
            render(view: "create", model: [lexToDictInstance: lexToDictInstance])
        }
    }

    def show = {
        def lexToDictInstance = LexToDict.get(params.id)
        if (!lexToDictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lexToDictInstance: lexToDictInstance]
        }
    }

    def edit = {
        def lexToDictInstance = LexToDict.get(params.id)
        if (!lexToDictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lexToDictInstance: lexToDictInstance]
        }
    }

    def update = {
        def lexToDictInstance = LexToDict.get(params.id)
        if (lexToDictInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lexToDictInstance.version > version) {
                    
                    lexToDictInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lexToDict.label', default: 'LexToDict')] as Object[], "Another user has updated this LexToDict while you were editing")
                    render(view: "edit", model: [lexToDictInstance: lexToDictInstance])
                    return
                }
            }
            lexToDictInstance.properties = params
            if (!lexToDictInstance.hasErrors() && lexToDictInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), lexToDictInstance.id])}"
                redirect(action: "show", id: lexToDictInstance.id)
            }
            else {
                render(view: "edit", model: [lexToDictInstance: lexToDictInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lexToDictInstance = LexToDict.get(params.id)
        if (lexToDictInstance) {
            try {
                lexToDictInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lexToDict.label', default: 'LexToDict'), params.id])}"
            redirect(action: "list")
        }
    }
}
