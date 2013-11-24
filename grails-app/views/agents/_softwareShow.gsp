
<%-- 
By Dr. Paolo Ciccarese <paolo.ciccarese@gmail.com>

Parameters list
 1) user | instance of GroupCreateCommand
Stylesheet
 1) fieldError | background and font color in erroneous text fields
--%>

<div class="sectioncontainer">
	<g:if test="${software!=null}">
		<table>
			<tbody>
				<%-- 
				<tr>
					<td valign="top" colspan="2"  style="horizontal-align:center;">
						<img src="${resource(dir:'images/dashboard',file:'no_image.gif',plugin:'users-module')}" width="200px" />
					</td>
				</tr>
				--%>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.ver!='hide'}">
					<tr>
						<td valign="top" align="left">
							<g:message code="org.commonsemantics.grails.software.model.field.ver" default="Version"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${software?.ver}">${software?.ver}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.name!='hide'}">
					<tr>
						<td valign="top" align="left">
							<g:message code="org.commonsemantics.grails.software.model.field.name" default="Name"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${software?.name}">${software?.name}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<g:if test="${grailsApplication.config.org.commonsemantics.grails.software.model.field.description!='hide'}">
					<tr>
						<td valign="top"  align="left">
							<g:message code="org.commonsemantics.grails.software.model.field.description" default="Description"/>
						</td>
						<td valign="top" align="left">
							<g:if test="${software?.description}">${software?.description}</g:if>
							<g:else>-</g:else>
						</td>
					</tr>
				</g:if>
				<tr>
					<td valign="top"  align="left">
						<g:message code="org.commonsemantics.grails.software.model.field.displayName" default="Display name"/>
					</td>
					<td valign="top" align="left">
						${software?.displayName}
					</td>
				</tr>				
		</table>
	</g:if>
	<g:else>
		<g:render plugin="cs-commons" template="/lenses/error" model="['message':'No software defined.']"/>
	</g:else>
</div>


