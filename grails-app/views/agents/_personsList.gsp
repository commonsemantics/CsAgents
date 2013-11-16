<%@ page import="org.commonsemantics.grails.agents.model.Person" %>
<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<div id="request" class="sectioncontainer">
<div class="dialog">
	<div class="list">
	<table class="tablelist">
		<thead>
			<tr>
				<g:sortableColumn property="name" title="${message(code: 'agentPerson.id.label', default: 'Name')}" />
				<g:sortableColumn property="displayName" title="${message(code: 'agentPerson.id.label', default: 'Display Name')}" />
				<g:sortableColumn property="email" title="${message(code: 'agentPerson.id.label', default: 'Email')}" />
				<g:sortableColumn property="dateCreated" title="${message(code: 'agentPerson.id.label', default: 'Created on')}" />
				<g:sortableColumn property="lastUpdated" title="${message(code: 'agentPerson.id.label', default: 'Last updated')}" />
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${persons}" status="i" var="person">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		     		<td>${person.lastName} ${person.firstName} </td>
		     		<td><g:if test="${person?.displayName?.length()>0}">${person.displayName}</g:if></td>
					<td>${person.email}</td>
		     		<td><g:formatDate format="MM/dd/yyyy hh:mm" date="${person.dateCreated}"/></td>
		     		<td><g:formatDate format="MM/dd/yyyy hh:mm" date="${person.lastUpdated}"/></td>

		     		<td>
		     			<div class="buttons">
							<g:form>
								<g:hiddenField name="id" value="${person?.id}" /> 
								<g:hiddenField name="redirect" value="listUsers" />
								<span class="button">
									<g:actionSubmit class="edit"  action="testEditPerson" value="${message(code: 'default.button.edit.account.label', default: 'Edit')}" />
								</span>
								<g:if test="${fieldValue(bean: user, field: 'accountLocked') == 'true'}">
									<span class="button">
										<g:actionSubmit class="unlock" action="unlockUser" value="${message(code: 'default.button.unlock.account.label', default: 'Unlock')}" />
									</span>
								</g:if>
								<g:elseif test="${fieldValue(bean: user, field: 'accountLocked') == 'false'}">
									<span class="button">
										<g:actionSubmit class="lock" action="lockUser" value="${message(code: 'default.button.lock.account.label', default: 'Lock')}"
										onclick="return confirm('${message(code: 'default.button.lock.account.confirm.message', default: 'Are you sure you want to lock this account?')}');" />
									</span>
								</g:elseif>
								<g:if test="${fieldValue(bean: user, field: 'enabled') == 'true'}">
									<span class="button">
										<g:actionSubmit class="disable" action="disableUser" value="${message(code: 'default.button.disable.account.label', default: 'Disable')}" 
										onclick="return confirm('${message(code: 'default.button.disable.account.confirm.message', default: 'Are you sure you want to disable this account?')}');"/>
									</span>
								</g:if>
								<g:elseif test="${fieldValue(bean: user, field: 'enabled') == 'false'}">
									<span class="button">
										<g:actionSubmit class="enable" action="enableUser" value="${message(code: 'default.button.enable.account.label', default: 'Enable')}" />
									</span>
								</g:elseif>
							</g:form>
						</div>
		     		</td>
		     	</tr>
			</g:each>
		</tbody>
	</table>
	<div class="paginateButtons">
   		<g:paginate total="${personsTotal}"/> 
	</div>
</div>
</div>
</div>