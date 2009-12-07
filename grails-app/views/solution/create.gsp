
<%@ page import="com.nazt.Solution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solution.label', default: 'Solution')}" />
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
            <g:hasErrors bean="${solutionInstance}">
            <div class="errors">
                <g:renderErrors bean="${solutionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
		                  <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="TokenizedText"><g:message code="solution.TokenizedText.label" default="TokenizedText" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'word', 'errors')}">
                                   ${dataKeeperInstance.tokenizedText}
                                </td>
                            </tr>
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
                                    <label for="experiment"><g:message code="solution.experiment.label" default="Experiment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'experiment', 'errors')}">
									
                                    <g:select name="experiment.id" from="${dataKeeperInstance?.experiment}" optionKey="id" value="${dataKeeperInstance?.experiment?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data"><g:message code="solution.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: solutionInstance, field: 'data', 'errors')}">
                                    <g:if test="${params.dataKeeper?.id}">
											<g:hiddenField name="data.id" value="${params.dataKeeper?.id}" />
											<g:hiddenField name="fromKeeper" value="${params.dataKeeper?.id}" />
											${params.dataKeeper?.id}
                                    </g:if>
									<g:else>
										<g:select name="data.id" from="${com.nazt.DataKeeper.list()}" optionKey="id" value="${solutionInstance?.data?.id}"  />
									</g:else>
                                    
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
