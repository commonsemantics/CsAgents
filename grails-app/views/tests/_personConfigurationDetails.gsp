<%@ page import="org.commonsemantics.grails.agents.model.Person" %>
<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<h2>Configurations (External configuration)</h2>

<h3>Mandatory Fields </h3>
&nbsp;org.commonsemantics.grails.persons.model.fields.mandatory = ${AgentsUtils.getPersonConfigurationMandatoryFields(grailsApplication)}<br/><br/>

<h3>All Resulting Mandatory Fields </h3>
&nbsp;${AgentsUtils.getPersonDynamicMandatoryFields(grailsApplication)}<br/><br/>

<h3>Flexible Fields </h3>
<g:if test="${AgentsUtils.isPersonStaticPropertyExisting('optional')!=null}">
	&nbsp;${Person.optional}<br/><br/>
</g:if>
<g:else>
	<table class="tabletest">
		<tr align="left">
			<td>&nbsp;No optional fields defined</td>
		</tr>
	</table>
</g:else>

<%-- Alternative A --%>
<table class="tabletest">
	<tr align="left">
		<th>Field</th><th>Value</th><th>Configuration entry</th>
	</tr>
	<g:each in="${Person.optional}" var="option">
		<tr>	
			<td>${option}</td>
			<td>
				${grailsApplication.config.org.commonsemantics.grails.persons.model.field[option]}
				<g:if test="${!grailsApplication.config.org.commonsemantics.grails.persons.model.field[option]}">show</g:if>
			</td>
			<td> 
				org.commonsemantics.grails.persons.model.field.${option}=${grailsApplication.config.org.commonsemantics.grails.persons.model.field[option]}<g:if test="${!grailsApplication.config.org.commonsemantics.grails.persons.model.field[option]}">show</g:if>
			</td>
		</tr>
	</g:each>
</table>


<%-- Alternative B --%>
<%-- 
<table cellpadding=5>
	<tr align="left">
		<th>Field</th><th>Value</th><th>Configuration entry</th>
	</tr>
	<% User.optional.each { option -> %>
         <tr>
         	<td><%="${option}" %></td>
         	<td><%="${grailsApplication.config.org.commonsemantics.grails.users.model.field[option]}" %></td>
         	<td> org.commonsemantics.grails.users.model.field.${option}</td>
         </tr>
    <%}%>
</table>
--%>