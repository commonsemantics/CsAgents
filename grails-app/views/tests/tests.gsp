<!doctype html>
<html>
	<head>
		<meta name="layout" content="commonsemantics"/>
	</head>
	<body>
		<div style="padding-left:10px;">
			<h1>${grailsApplication.metadata['app.name']} UI Components Tests list</h1>
			<table cellpadding="2">
				<tr>
					<th>Test Id</th>
					<th>Description</th>
					<th>Version 0.1</th>
				</tr>
				
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testShowPerson', 
						testId: '00', 
						testDescription: 'Person show',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testShowPersonLensNoPerson', 
						testId: '01', 
						testDescription: 'Person show (no person defined)',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testEditPerson', 
						testId: '02', 
						testDescription: 'Person edit',
						passed: 'true']" />	
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testCreatePerson', 
						testId: '03', 
						testDescription: 'Person create',
						passed: 'true']" />	
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testListPersons', 
						testId: '04', 
						testDescription: 'Persons list',
						passed: 'true']" />		
				
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testShowSoftware', 
						testId: '10', 
						testDescription: 'Software show',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testShowSoftwareLensNoSoftware', 
						testId: '11', 
						testDescription: 'Software show (no software defined)',
						passed: 'true']" />		
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testEditSoftware', 
						testId: '12', 
						testDescription: 'Software edit',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testCreateSoftware', 
						testId: '13', 
						testDescription: 'Software create',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'testListSoftware', 
						testId: '14', 
						testDescription: 'Software list',
						passed: 'true']" />
				
			</table>	
		</div>
	</body>
</html>
