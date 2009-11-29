
<%@ page import="com.nazt.LexToDict" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lexToDict.label', default: 'LexToDict')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'lexToDict.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="vocaburary" title="${message(code: 'lexToDict.vocaburary.label', default: 'Vocaburary')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'lexToDict.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lexToDictInstanceList}" status="i" var="lexToDictInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lexToDictInstance.id}">${fieldValue(bean: lexToDictInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: lexToDictInstance, field: "vocaburary")}</td>
                        
                            <td><g:formatDate date="${lexToDictInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lexToDictInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
