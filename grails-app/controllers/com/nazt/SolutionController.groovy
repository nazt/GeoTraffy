package com.nazt

class SolutionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [solutionInstanceList: Solution.list(params), solutionInstanceTotal: Solution.count()]
    }

    def create = {
        def solutionInstance = new Solution()
        solutionInstance.properties = params
        return [solutionInstance: solutionInstance]
    }

    def save = {
/*		params.word=['a','b','c']*/
		println params
		params.word.tokenize(',').each { 
			params.word=it	
	        def solutionInstance = new Solution(params)
			println params
			println solutionInstance
	        if (solutionInstance.save(flush: true)) {
	            flash.message = "${message(code: 'default.created.message', args: [message(code: 'solution.label', default: 'Solution'), solutionInstance.id])}"
	/*            redirect(action: "show", id: solutionInstance.id)*/
				println 'ok'
	        }
	        else {
	//            render(view: "create", model: [solutionInstance: solutionInstance])
				  println 'error'
	        }
 		}
		if(params.fromKeeper)
		{
	 		redirect(controller:"dataKeeper",action:"show",id:params.fromKeeper)
			
		}
		else
			redirect(action: "show")
    }

    def show = {
        def solutionInstance = Solution.get(params.id)
        if (!solutionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
            redirect(action: "list")
        }
        else {
            [solutionInstance: solutionInstance]
        }
    }

    def edit = {
        def solutionInstance = Solution.get(params.id)
        if (!solutionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [solutionInstance: solutionInstance]
        }
    }

    def update = {
        def solutionInstance = Solution.get(params.id)
        if (solutionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (solutionInstance.version > version) {
                    
                    solutionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'solution.label', default: 'Solution')] as Object[], "Another user has updated this Solution while you were editing")
                    render(view: "edit", model: [solutionInstance: solutionInstance])
                    return
                }
            }
            solutionInstance.properties = params
            if (!solutionInstance.hasErrors() && solutionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'solution.label', default: 'Solution'), solutionInstance.id])}"
                redirect(action: "show", id: solutionInstance.id)
            }
            else {
                render(view: "edit", model: [solutionInstance: solutionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def solutionInstance = Solution.get(params.id)
        if (solutionInstance) {
            try {
                solutionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), params.id])}"
            redirect(action: "list")
        }
    }
}
