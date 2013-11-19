<%@ page import="org.commonsemantics.grails.agents.model.Software" %>
<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<h2>Configurations (External configuration)</h2>

<h3>Mandatory Fields </h3>
&nbsp;org.commonsemantics.grails.software.model.fields.mandatory = ${AgentsUtils.getSoftwareMandatoryFields(grailsApplication)}<br/><br/>

<h3>Flexible Fields </h3>
<g:if test="${AgentsUtils.isStaticSoftwarePropertyExisting('optional')!=null}">
	&nbsp;${Software.optional}<br/><br/>
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
	<g:each in="${Software.optional}" var="option">
		<tr>	
			<td>${option}</td>
			<td>
				${grailsApplication.config.org.commonsemantics.grails.software.model.field[option]}
				<g:if test="${!grailsApplication.config.org.commonsemantics.grails.software.model.field[option]}">show</g:if>
			</td>
			<td> 
				org.commonsemantics.grails.software.model.field.${option}=${grailsApplication.config.org.commonsemantics.grails.software.model.field[option]}<g:if test="${!grailsApplication.config.org.commonsemantics.grails.software.model.field[option]}">show</g:if>
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