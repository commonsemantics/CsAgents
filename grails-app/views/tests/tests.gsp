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
						action:'showPerson', 
						plugin:'cs-agents',
						testId: '00', 
						testDescription: 'Person show',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'showPersonLensNoPerson', 
						plugin:'cs-agents',
						testId: '01', 
						testDescription: 'Person show (no person defined)',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'editPerson', 
						plugin:'cs-agents',
						testId: '02', 
						testDescription: 'Person edit',
						passed: 'true']" />	
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'createPerson',
						plugin:'cs-agents',
						testId: '03', 
						testDescription: 'Person create',
						passed: 'true']" />	
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'listPersons', 
						plugin:'cs-agents',
						testId: '04', 
						testDescription: 'Persons list',
						passed: 'true']" />		

				<tr>
					<th>Test Id</th>
					<th>Description</th>
					<th>Version 0.1</th>
				</tr>	
			
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'showSoftware', 
						plugin:'cs-agents',
						testId: '10', 
						testDescription: 'Software show',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'showSoftwareLensNoSoftware', 
						plugin:'cs-agents',
						testId: '11', 
						testDescription: 'Software show (no software defined)',
						passed: 'true']" />		
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'editSoftware', 
						plugin:'cs-agents',
						testId: '12', 
						testDescription: 'Software edit',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'createSoftware', 
						plugin:'cs-agents',
						testId: '13', 
						testDescription: 'Software create',
						passed: 'true']" />
						
				<g:render plugin="cs-agents" template="/tests/testEntry" 
					model="[
						action:'listSoftware', 
						plugin:'cs-agents',
						testId: '14', 
						testDescription: 'Software list',
						passed: 'true']" />				
			</table>	
		</div>
	</body>
</html>
