<%@ page import="org.commonsemantics.grails.agents.model.Person" %>
<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<div id="request" class="sectioncontainer">
<div class="dialog">
	<div class="list">
	<table class="tablelist">
		<thead>
			<tr>
				<g:sortableColumn property="name" title="${message(code: 'agentPerson.id.label', default: 'Name')}" />
				<g:sortableColumn property="displayName" title="${message(code: 'agentPerson.id.label', default: 'Disaplay name')}" />
				<g:sortableColumn property="description" title="${message(code: 'agentPerson.id.label', default: 'Description')}" />
				<g:sortableColumn property="ver" title="${message(code: 'agentPerson.id.label', default: 'Version')}" />
				<g:sortableColumn property="dateCreated" title="${message(code: 'agentPerson.id.label', default: 'Created on')}" />
				<g:sortableColumn property="lastUpdated" title="${message(code: 'agentPerson.id.label', default: 'Last updated')}" />
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${software}" status="i" var="softw">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		     		<td>${softw.name} ${softw.name} </td>
		     		<td><g:if test="${softw?.displayName?.length()>0}">${softw.displayName}</g:if></td>
					<td><g:if test="${softw?.description?.length()>0}">${softw.description}</g:if></td>
					<td><g:if test="${softw?.ver?.length()>0}">${softw.ver}</g:if></td>
		     		<td><g:formatDate format="MM/dd/yyyy hh:mm" date="${softw.dateCreated}"/></td>
		     		<td><g:formatDate format="MM/dd/yyyy hh:mm" date="${softw.lastUpdated}"/></td>

		     		<td>
		     			<div class="buttons">
							<g:form>
								<g:hiddenField name="id" value="${softw?.id}" /> 
								<g:hiddenField name="redirect" value="listUsers" />
								<span class="button">
									<g:actionSubmit class="edit"  action="testEditPerson" value="${message(code: 'default.button.edit.account.label', default: 'Edit')}" />
								</span>
							</g:form>
						</div>
		     		</td>
		     	</tr>
			</g:each>
		</tbody>
	</table>
	<div class="paginateButtons">
   		<g:paginate total="${softwareTotal}"/> 
	</div>
</div>
</div>
</div>