<%@ page import="org.commonsemantics.grails.agents.utils.AgentsUtils" %>


<table>
	<tbody>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.title!='hide'}">			
			<g:render plugin="cs-user" template="/agents/uPropertyEntry" model="[
				messageCode:'org.commonsemantics.grails.persons.model.field.title',
				messageDefault:'Title',
				mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'title'),
				variable: 'title',
				value: person?.title,
				caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
			]" />
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.firstName!='hide'}">
			<tr class="prop">
				<td valign="top" width="160px" class="name">
					<label for="firstName"><g:message code="org.commonsemantics.grails.persons.model.field.firstName" default="First name"/></label>
				</td>
				<td valign="top" width="155px" class="value">
					<g:textField name="firstName" style="width: 276px;"
						value="${person?.firstName}"  class="${hasErrors(bean: person, field: 'firstName', 'csc-field-error')}"/>
				</td>
				<td valign="top" class="caption">
		           	(max 255 <g:message code="org.commonsemantics.grails.general.chars" default="chars"/>)
		        </td>
			</tr>
			<g:if test="${person?.errors?.hasFieldErrors('firstName')}">
				<tr>
					<td></td>
					<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="firstName" /></td>
				</tr>
			</g:if>
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.middleName!='hide'}">
			<tr class="prop">
				<td valign="top" width="160px" class="name">
					<label for="middleName">
						<g:message code="org.commonsemantics.grails.persons.model.field.middleName" default="Middle name"/>
					</label>
				</td>
				<td valign="top" width="155px" class="value">
					<g:textField name="middleName" style="width: 276px;"
						value="${person?.middleName}"  class="${hasErrors(bean: person, field: 'middleName', 'csc-field-error')}"/>
				</td>
				<td valign="top" class="caption">
					(max 255 <g:message code="org.commonsemantics.grails.general.chars" default="chars"/>)
		        </td>
			</tr>
			<g:if test="${person?.errors?.hasFieldErrors('middleName')}">
				<tr>
					<td></td>
					<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="middleName" /></td>
				</tr>
			</g:if>
		</g:if>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.lastName!='hide'}">
			<tr class="prop">
				<td valign="top" class="name">
					<label for="lastName">
						<g:message code="org.commonsemantics.grails.persons.model.field.lastName" default="Last name"/>
					</label>
				</td>
				<td valign="top" class="value">
					<g:textField name="lastName" style="width: 276px;"
						value="${person?.lastName}"  class="${hasErrors(bean: person, field: 'lastName', 'csc-field-error')}"/>
				</td>
				<td valign="top" class="caption">
					(max 255 <g:message code="org.commonsemantics.grails.general.chars" default="chars"/>)
		        </td>
			</tr>
			<g:if test="${person?.errors?.hasFieldErrors('lastName')}">
				<tr>
					<td></td>
					<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="lastName" /></td>
				</tr>
			</g:if>
		</g:if>
		<tr class="prop">
			<td valign="top" class="name">
				<label for="displayName">
					<g:message code="org.commonsemantics.grails.persons.model.field.displayName" default="Display name"/>*
				</label>
			</td>
			<td valign="top" class="value">
				<g:textField name="displayName" style="width: 276px;"
					value="${person?.displayName}"  class="${hasErrors(bean: person, field: 'displayName', 'csc-field-error')}"/>
			</td>
			<td valign="top" class="caption">
				(max 255 <g:message code="org.commonsemantics.grails.general.chars" default="chars"/>)
	        </td>
	        <g:if test="${person?.errors?.hasFieldErrors('displayName')}">
				<tr>
					<td></td>
					<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="displayName" /></td>
				</tr>
			</g:if>
		</tr>
		
		<%-- 
		<g:render plugin="cs-user" template="/agents/uPropertyEntry" model="[
			messageCode:'org.commonsemantics.grails.persons.model.field.displayName',
			messageDefault:'Display name',
			mandatory:AgentsUtils.isPersonFieldMandatory(grailsApplication, 'displayName'),
			variable: 'displayName',
			value: person?.displayName,
			caption: '(max 255 ' +  g.message(code: 'org.commonsemantics.grails.general.chars',default:'chars') + ')'
		]" />
		--%>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="email">Email*</label>
			</td>
			<td valign="top" class="value">
				<g:textField name="email" style="width: 276px;"
					value="${person?.email}"  class="${hasErrors(bean: person, field: 'email', 'csc-field-error')}"/>
			</td>
			<td valign="top" class="caption">
				(valid email)
	        </td>
	        <g:if test="${person?.errors?.hasFieldErrors('email')}">
				<tr>
					<td></td>
					<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="email" /></td>
				</tr>
			</g:if>
		</tr>
		<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.affiliation!='hide'}">
			<tr class="prop">
				<td valign="top" class="name">
					<label for="affiliation">
						<g:message code="org.commonsemantics.grails.persons.model.field.affiliation" default="Affiliation"/>
					</label>
				</td>
				<td valign="top" class="value">
					<g:textField name="affiliation" style="width: 276px;"
						value="${person?.affiliation}"  class="${hasErrors(bean: person, field: 'affiliation', 'csc-field-error')}"/>
				</td>
				<td valign="top" class="caption">
					(max 255 <g:message code="org.commonsemantics.grails.general.chars" default="chars"/>)
		        </td>
		        <g:if test="${person?.errors?.hasFieldErrors('affiliation')}">
					<tr>
						<td></td>
						<td colspan="2" class="csc-error-message"><g:renderErrors bean="${person}" field="affiliation" /></td>
					</tr>
				</g:if>
			</tr>
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

