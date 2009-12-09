package com.nazt
import groovyx.net.http.*;
class ExperimentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [experimentInstanceList: Experiment.list(params), experimentInstanceTotal: Experiment.count()]
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
			
				def loaded_data=reader.getText()
				def counter=0
				def myTypeList,myIndexList=[]
				Experiment experiment_tmp=new Experiment(name:params.experimentName,total:0,totalInDict:LexToDict.list().size()).save()
			loaded_data.eachLine{    
					try {
							servletContext.lextoObj.wordInstance(it.trim())
							myTypeList = servletContext.lextoObj.getTypeList()
							myIndexList=servletContext.lextoObj.getIndexList()

							def indexer=0
							def longlexnews=""
							myIndexList.eachWithIndex{ val, idx ->
							longlexnews+= it[indexer..val-1] + "|"
							indexer=val
						}
						new DataKeeper(rawText:it.trim(),tokenizedText:longlexnews,experiment:experiment_tmp).save()
							println it.trim();
							++counter;
						} 
					catch(Exception e) {
						println 'exception caught !'
						println e
					}
				}
				println counter
				if(counter>0)
				{
					experiment_tmp.total=counter
					experiment_tmp.save()
				}
				else experiment_tmp.delete()
			
 			}
			  response.'404' = { resp -> 
			    render 'Not found'
			  }
			}		
		}
		catch(Exception e) {
			flash.defaultMessage = "book deleted"
			println 'error'
			println e
          //  redirect(action: "remote")
		}
			println 'end ja'
			redirect(controller:"dataKeeper",action:"list")
			
			
	}
		
    def create = {
        def experimentInstance = new Experiment()
        experimentInstance.properties = params
        return [experimentInstance: experimentInstance]
    }

    def save = {
        def experimentInstance = new Experiment(params)
        if (experimentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'experiment.label', default: 'Experiment'), experimentInstance.id])}"
            redirect(action: "show", id: experimentInstance.id)
        }
        else {
            render(view: "create", model: [experimentInstance: experimentInstance])
        }
    }

    def show = {
        def experimentInstance = Experiment.get(params.id)
        if (!experimentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [experimentInstance: experimentInstance]
        }
    }

    def edit = {
        def experimentInstance = Experiment.get(params.id)
        if (!experimentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [experimentInstance: experimentInstance]
        }
    }

    def update = {
        def experimentInstance = Experiment.get(params.id)
        if (experimentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (experimentInstance.version > version) {
                    
                    experimentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'experiment.label', default: 'Experiment')] as Object[], "Another user has updated this Experiment while you were editing")
                    render(view: "edit", model: [experimentInstance: experimentInstance])
                    return
                }
            }
            experimentInstance.properties = params
            if (!experimentInstance.hasErrors() && experimentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'experiment.label', default: 'Experiment'), experimentInstance.id])}"
                redirect(action: "show", id: experimentInstance.id)
            }
            else {
                render(view: "edit", model: [experimentInstance: experimentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def experimentInstance = Experiment.get(params.id)
        if (experimentInstance) {
            try {
                experimentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])}"
            redirect(action: "list")
        }
    }
}
