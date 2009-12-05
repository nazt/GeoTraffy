
<%@ page import="com.nazt.Solution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solution.label', default: 'Solution')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${solutionInstance}">
            <div class="errors">
                <g:renderErrors bean="${solutionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${solutionInstance?.id}" />
                <g:hiddenField name="version" value="${solutionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="word"><g:message code="solution.word.label" default="Word" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'word', 'errors')}">
                                    <g:textField name="word" value="${solutionInstance?.word}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="found"><g:message code="solution.found.label" default="Found" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'found', 'errors')}">
                                    <g:checkBox name="found" value="${solutionInstance?.found}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="solution.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'data', 'errors')}">
                                    <g:select name="data.id" from="${com.nazt.DataKeeper.list()}" optionKey="id" value="${solutionInstance?.data?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
