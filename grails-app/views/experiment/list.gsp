
<%@ page import="com.nazt.Experiment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'experiment.label', default: 'Experiment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'experiment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'experiment.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="total" title="${message(code: 'experiment.total.label', default: 'Total')}" />
                        
                            <g:sortableColumn property="correctness" title="${message(code: 'experiment.lastUpdated.label', default: 'Correctness')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'experiment.dateCreated.label', default: 'Total in Dictionary')}" />

                            <g:sortableColumn property="dateCreated" title="${message(code: 'experiment.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${experimentInstanceList}" status="i" var="experimentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${experimentInstance.id}">${fieldValue(bean: experimentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: experimentInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: experimentInstance, field: "total")}</td>
                        
                            <td>  
								${fieldValue(bean: experimentInstance, field: "correctness")} %
							</td>
							<td>${experimentInstance.totalInDict}</td>                        
                            <td><g:formatDate date="${experimentInstance.dateCreated}" /></td>

                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${experimentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
