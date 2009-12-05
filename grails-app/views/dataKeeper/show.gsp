
<%@ page import="com.nazt.DataKeeper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataKeeper.label', default: 'DataKeeper')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataKeeperInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.rawText.label" default="Raw Text" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataKeeperInstance, field: "rawText")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.tokenizedText.label" default="Tokenized Text" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataKeeperInstance, field: "tokenizedText")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dataKeeperInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dataKeeperInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.experiment.label" default="Experiment" /></td>
                            
                            <td valign="top" class="value"><g:link controller="experiment" action="show" id="${dataKeeperInstance?.experiment?.id}">${dataKeeperInstance?.experiment?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
					
                       <!-- <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.solution.label" default="Not Found" /></td>

                            <td valign="top" style="text-align: left;" class="value">
       							${diffList.sort()}
                            </td>

                        </tr>        -->
                      <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.solution.label" default="Correctness" /></td>

                            <td valign="top" style="text-align: left;" class="value">
								<g:if test="${dataKeeperInstance.solution.size() >0}">
								    
		       						${dataKeeperInstance.solution.size()-diffList.size()}/${dataKeeperInstance.solution.size()} =   ${(dataKeeperInstance.solution.size()-diffList.size())/dataKeeperInstance.solution.size()*100 as float}%  
								</g:if>
								<g:else>
								     I don't have any solution !
								</g:else>
	

                            </td>

                        </tr>             
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataKeeper.solution.label" default="Solution" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
          <ul>
                                <g:each in="${dataKeeperInstance.solution.sort{it.id}}" var="s">
                                   
									<g:if test="${diffList.toString().contains(s.word) }">
										  <div class="errors">
 										  ﻿----- <g:link controller="solution" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
										 </div>
									</g:if>
									<g:else>
										<div class="message">
											<g:link controller="solution" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
										</div>
									</g:else>
                                </g:each>
<g:link controller="solution" action="create" params="['dataKeeper.id': dataKeeperInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'solution.label', default: 'Solution')])}</g:link>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dataKeeperInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
