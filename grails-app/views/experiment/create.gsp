
<%@ page import="com.nazt.Experiment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'experiment.label', default: 'Experiment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${experimentInstance}">
            <div class="errors">
                <g:renderErrors bean="${experimentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="experiment.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: experimentInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${experimentInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="total"><g:message code="experiment.total.label" default="Total" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: experimentInstance, field: 'total', 'errors')}">
                                    <g:textField name="total" value="${fieldValue(bean: experimentInstance, field: 'total')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="experiment.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: experimentInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${experimentInstance?.lastUpdated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="experiment.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: experimentInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${experimentInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
