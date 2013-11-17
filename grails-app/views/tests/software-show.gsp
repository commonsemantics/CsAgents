<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="commonsemantics-tests"/>
		<title>${grailsApplication.metadata['app.name']}.${label}</title>
	</head>
	<body>
		<div class="csc-main">
			<h1>${grailsApplication.metadata['app.name']}.${label} ${description}</h1>
					
			<g:render plugin="cs-agents" template="/tests/softwareConfigurationDetails" />
			
			<h3>${description} (lang=<%=RequestContextUtils.getLocale(request).language %>)*</h3>
			<p>
				id=<%=software?.id %>
				<g:if test="${person.hasProperty('dateCreated')}">dateCreated=<%=person.dateCreated %></g:if>
				<g:if test="${person.hasProperty('lastUpdated')}">lastUpdated=<%=person.lastUpdated %></g:if>
			</p> 
			<p>* to change the Locale add ?lang=language to the URL of this page</p>
			<br/>
			
			<g:form method="post" >
				<g:hiddenField name="id" value="${software?.id}" /> 
				<g:hiddenField name="testId" value="${label}" /> 
				<g:hiddenField name="testDescription" value="After ${description}" /> 
				
				<div class="csc-lens-container">
					<g:render plugin="cs-agents" template="/agents/softwareShow" />
				</div>	
				
				<br/>
				<div class="buttons">
					<span class="button">
						<g:actionSubmit class="save" action="testEditSoftware" value="${message(code: 'org.commonsemantics.grails.users.profile.submit', default: 'Edit Software')}" />
					</span>
				</div>
			</g:form>
		</div>
	</body>
</html>