
<%-- 
By Dr. Paolo Ciccarese <paolo.ciccarese@gmail.com>

Parameters list
 1) user | instance of GroupCreateCommand
Stylesheet
 1) fieldError | background and font color in erroneous text fields
--%>

<div class="sectioncontainer">
	<g:if test="${person!=null}">
		<table>
			<tbody>
				<%-- 
				<tr>
					<td valign="top" colspan="2"  style="horizontal-align:center;">
						<img src="${resource(dir:'images/dashboard',file:'no_image.gif',plugin:'users-module')}" width="200px" />
					</td>
				</tr>
				--%>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.title!='hide'}">
					<tr>
						<td valign="top" align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.title" default="Title"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.title}">${person?.title}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.firstName!='hide'}">
					<tr>
						<td valign="top" align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.firstName" default="First name"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.firstName}">${person?.firstName}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.middleName!='hide'}">
					<tr>
						<td valign="top"  align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.middleName" default="Middle name"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.middleName}">${person?.middleName}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.lastName!='hide'}">
					<tr>
						<td valign="top"  align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.lastName" default="Last name"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.lastName}">${person?.lastName}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<tr>
					<td valign="top"  align="left">
						<g:message code="org.commonsemantics.grails.persons.model.field.displayName" default="Display name"/>
					</td>
					<td valign="top" align="left">
						${person?.displayName}
					</td>
				</tr>
				<tr>
					<td valign="top" width="150px" align="left">Email</td>
					<td valign="top" align="left">
						${person?.email}
					</td>
				</tr>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.affiliation!='hide'}">
					<tr>
						<td valign="top"  align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.affiliation" default="Affiliation"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.affiliation}">${person?.affiliation}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.persons.model.field.country!='hide'}">
					<tr>
						<td valign="top"  align="left">
							<g:message code="org.commonsemantics.grails.persons.model.field.country" default="Country"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${person?.country}">${person?.country}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
		</table>
	</g:if>
	<g:else>
		<g:render plugin="cs-commons" template="/lenses/error" model="['message':'No person defined.']"/>
	</g:else>
</div>


