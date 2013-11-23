<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>


<table>
	<tbody>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.title!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.title',
				messageDefault:'Title',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'title'),
				bean: person,
				variable: 'title',
				value: person?.title,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.firstName!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.firstName',
				messageDefault:'First name',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'firstName'),
				bean: person,
				variable: 'firstName',
				value: person?.firstName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.middleName!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.middleName',
				messageDefault:'Middle name',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'middleName'),
				bean: person,
				variable: 'middleName',
				value: person?.middleName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.lastName!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.lastName',
				messageDefault:'Last name',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'lastName'),
				bean: person,
				variable: 'lastName',
				value: person?.lastName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.displayName!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.displayName',
				messageDefault:'Display name',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'displayName'),
				bean: person,
				variable: 'displayName',
				value: person?.displayName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.email!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.email',
				messageDefault:'Email',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'email'),
				bean: person,
				variable: 'email',
				value: person?.email,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.affiliation!='hide'}">			
			<g:render plugin="cs-agents" template="/agents/agentPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.affiliation',
				messageDefault:'Affiliation',
				mandatory:AgentsUtils.isPersonFieldRequired(grailsApplication, 'affiliation'),
				bean: person,
				variable: 'affiliation',
				value: person?.affiliation,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.country!='hide'}">
			<tr class="prop">
				<td valign="top" class="name">
					<label for="country">
						<g:message code="org.commonsemantics.grails.persons.model.field.country" default="Country"/>
					</label>
				</td>
				<td valign="top" class="value">
					<%-- 
					<g:textField name="country" style="width: 240px;"
						value="${person?.country}"  class="${hasErrors(bean: person, field: 'displayName', 'fieldError')}"/>
					--%>
					<%-- http://grails.org/doc/latest/ref/Tags/countrySelect.html --%>
					<g:countrySelect name="country" value="${person?.country}"
	               			noSelection="['':'-Choose your country-']" default="usa"/>
	               		
	               		<%--  create select from a list of ISO3166_3 country codes --%>
					<%-- <g:countrySelect name="country" from="['gbr', 'usa', 'deu', 'ita']" value="${person?.country}"/> --%>
				</td>
				<td valign="top" class="caption">
		        </td>
			</tr>
		</g:if>
	</tbody>
</table>

