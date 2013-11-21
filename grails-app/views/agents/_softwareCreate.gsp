<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>


<table>
	<tbody>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.version!='hide'}">
			<g:render plugin="cs-user" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.software.model.field.version',
				messageDefault:'Version',
				mandatory:AgentsUtils.isSoftwareFieldMandatory(grailsApplication, 'ver'),
				variable: 'ver',
				bean: software,
				value: software?.ver,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.name!='hide'}">
			<g:render plugin="cs-user" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.software.model.field.name',
				messageDefault:'Name',
				mandatory:AgentsUtils.isSoftwareFieldMandatory(grailsApplication, 'name'),
				variable: 'name',
				bean: software,
				value: software?.name,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.description!='hide'}">
			<g:render plugin="cs-user" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.software.model.field.description',
				messageDefault:'Description',
				mandatory:AgentsUtils.isSoftwareFieldMandatory(grailsApplication, 'description'),
				variable: 'description',
				bean: software,
				value: software?.description,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:render plugin="cs-user" template="/agents/agentPropertyEntry" model="[
			messageCode:'org.commonsemantics.grails.software.model.field.displayName',
			messageDefault:'Display name',
			mandatory:AgentsUtils.isSoftwareFieldMandatory(grailsApplication, 'displayName'),
			variable: 'displayName',
			bean: software,
			value: software?.displayName,
			caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
		]" />
	</tbody>
</table>

