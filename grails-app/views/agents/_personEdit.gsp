<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>

<%-- by Paolo Ciccarese --%>
<%-- 
Parameters list
 1) item | instance of UserCreateCommand
Stylesheet
 1) fieldError | background and font color in erroneous text fields
--%>
<g:if test="${person!=null}">
	<table>
		<tbody>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.title!='hide'}">
				<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.persons.model.field.title',
					messageDefault:'Title',
					mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'title'),
					variable: 'title',
					bean: person,
					value: person?.title,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.firstName!='hide'}">
				<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.persons.model.field.firstName',
					messageDefault:'First name',
					mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'firstName'),
					variable: 'firstName',
					bean: person,
					value: person?.firstName,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.middleName!='hide'}">
				<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.persons.model.field.middleName',
					messageDefault:'Middle name',
					mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'middleName'),
					variable: 'middleName',
					bean: person,
					value: person?.middleName,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.lastName!='hide'}">				
				<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.persons.model.field.lastName',
					messageDefault:'Last name',
					mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'lastName'),
					variable: 'lastName',
					bean: person,
					value: person?.lastName,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>			
			<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.displayName',
				messageDefault:'Display name',
				mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'displayName'),
				variable: 'displayName',
				bean: person,
				value: person?.displayName,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
			<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.email',
				messageDefault:'Email',
				mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'email'),
				variable: 'email',
				bean: person,
				value: person?.email,
				caption: '(valid email)'
			]" />
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.affiliation!='hide'}">
				<g:render plugin="cs-agents" template="/agents/uPropertyEntry" model="[
					messageCode:'org.commonsemantics.grails.persons.model.field.affiliation',
					messageDefault:'Affiliation',
					mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'affiliation'),
					variable: 'affiliation',
					bean: person,
					value: person?.affiliation,
					caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
				]" />
			</g:if>
			<%-- Custom code to accommodate the country selector --%>
			<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.country!='hide'}">
				<tr class="prop">
					<td valign="top" class="name">
						<label for="country">
							<g:message code="org.commonsemantics.grails.persons.model.field.country" default="Country"/>
							<g:if test="${AgentsUtils.isPersonFieldMandatory(grailsApplication, 'country')==true}">*</g:if>
						</label>
					</td>
					<td valign="top" class="value">
						<%-- 
						<g:textField name="country" style="width: 240px;"
							value="${user?.country}"  class="${hasErrors(bean: user, field: 'displayName', 'fieldError')}"/>
						--%>
						<%-- http://grails.org/doc/latest/ref/Tags/countrySelect.html --%>
						<g:countrySelect name="country" value="${person?.country}"
                 			noSelection="['':'-Choose your country-']" default="usa"/>
                 		
                 		<%--  create select from a list of ISO3166_3 country codes --%>
						<%-- <g:countrySelect name="country" from="['gbr', 'usa', 'deu', 'ita']" value="${user?.country}"/> --%>
					</td>
					<td valign="top" class="caption">
			        </td>
				</tr>
			</g:if>
		</tbody>
	</table>
</g:if>
<g:else>
	<g:render plugin="cs-commons" template="/lenses/error" model="['message':'CsUser._userProfileFields: user object cannot be null.']"/>
</g:else>

