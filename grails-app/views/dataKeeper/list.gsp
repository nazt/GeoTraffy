
<%@ page import="com.nazt.DataKeeper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataKeeper.label', default: 'DataKeeper')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'dataKeeper.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="rawText" title="${message(code: 'dataKeeper.rawText.label', default: 'Raw Text')}" />
                        
                            <g:sortableColumn property="tokenizedText" title="${message(code: 'dataKeeper.tokenizedText.label', default: 'Tokenized Text')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'dataKeeper.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'dataKeeper.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <th><g:message code="dataKeeper.experiment.label" default="Experiment" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dataKeeperInstanceList}" status="i" var="dataKeeperInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dataKeeperInstance.id}">${fieldValue(bean: dataKeeperInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: dataKeeperInstance, field: "rawText")}</td>
                        
                            <td>${fieldValue(bean: dataKeeperInstance, field: "tokenizedText")}</td>
                        
                            <td><g:formatDate date="${dataKeeperInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${dataKeeperInstance.lastUpdated}" /></td>
                        
                            <td>${fieldValue(bean: dataKeeperInstance, field: "experiment")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dataKeeperInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
