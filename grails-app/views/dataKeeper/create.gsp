
<%@ page import="com.nazt.DataKeeper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataKeeper.label', default: 'DataKeeper')}" />
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
            <g:hasErrors bean="${dataKeeperInstance}">
            <div class="errors">
                <g:renderErrors bean="${dataKeeperInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rawText"><g:message code="dataKeeper.rawText.label" default="Raw Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataKeeperInstance, field: 'rawText', 'errors')}">
                                    <g:textField name="rawText" value="${dataKeeperInstance?.rawText}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tokenizedText"><g:message code="dataKeeper.tokenizedText.label" default="Tokenized Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataKeeperInstance, field: 'tokenizedText', 'errors')}">
                                    <g:textField name="tokenizedText" value="${dataKeeperInstance?.tokenizedText}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="dataKeeper.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataKeeperInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${dataKeeperInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="dataKeeper.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataKeeperInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${dataKeeperInstance?.lastUpdated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="experiment"><g:message code="dataKeeper.experiment.label" default="Experiment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataKeeperInstance, field: 'experiment', 'errors')}">
                                    <g:select name="experiment.id" from="${com.nazt.Experiment.list()}" optionKey="id" value="${dataKeeperInstance?.experiment?.id}"  />
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
