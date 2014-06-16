<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<%-- by Paolo Ciccarese --%>
<%-- 
Parameters list
 1) item | instance of UserCreateCommand
Stylesheet
 1) fieldError | background and font color in erroneous text fields
--%>
<g:if test="${software!=null}">
	<g:hiddenField name="id" value="${software?.id}" /> 
	<table>
		<tbody>
			
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.version!='hide'}">
				<g:render plugin="cs-users" template="/agents/agentPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.software.model.field.version',
					messageDefault:'Version',
					mandatory:AgentsUtils.isSoftwareFieldRequired(grailsApplication, 'ver'),
					variable: 'ver',
					bean: software,
					value: software?.ver,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.name!='hide'}">
				<g:render plugin="cs-users" template="/agents/agentPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.software.model.field.name',
					messageDefault:'Name',
					mandatory:AgentsUtils.isSoftwareFieldRequired(grailsApplication, 'name'),
					variable: 'name',
					bean: software,
					value: software?.name,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.description!='hide'}">
				<g:render plugin="cs-users" template="/agents/agentPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.software.model.field.description',
					messageDefault:'Description',
					mandatory:AgentsUtils.isSoftwareFieldRequired(grailsApplication, 'description'),
					variable: 'description',
					bean: software,
					value: software?.description,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:render plugin="cs-users" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.software.model.field.displayName',
				messageDefault:'Display name',
				mandatory:AgentsUtils.isSoftwareFieldRequired(grailsApplication, 'displayName'),
				variable: 'displayName',
				bean: software,
				value: software?.displayName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</tbody>
	</table>
</g:if>
<g:else>
	<g:render plugin="cs-commons" template="/lenses/error" model="['message':'No software defined.']"/>
</g:else>

