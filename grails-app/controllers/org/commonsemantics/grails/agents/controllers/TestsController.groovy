/*
 * Copyright 2013 Common Semantics (commonsemantics.org)
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.commonsemantics.grails.agents.controllers

import org.commonsemantics.grails.agents.commands.PersonCreateCommand
import org.commonsemantics.grails.agents.commands.PersonEditCommand
import org.commonsemantics.grails.agents.commands.SoftwareCreateCommand
import org.commonsemantics.grails.agents.commands.SoftwareEditCommand
import org.commonsemantics.grails.agents.model.Person
import org.commonsemantics.grails.agents.model.Software
import org.commonsemantics.grails.agents.utils.AgentsUtils

/**
 * @author Paolo Ciccarese <paolo.ciccarese@gmail.com>
 */
class TestsController {

	static defaultAction = "tests"
	
	def tests = {
		render (view:'tests')
	}
	
	// ------------------------
	//         PERSONS
	// ------------------------
	
	def testShowPerson = {
		def person = getPerson(params.id);		
		render (view:'person-show', model:[label:params.testId, description:params.testDescription, person:person]);
	}
	
	def testShowPersonLensNoPerson = {
		render (view:'person-show', model:[label:params.testId, description:params.testDescription]);
	}

	def testEditPerson = {
		def person = getPerson(params.id);		
		render (view:'person-edit', model:[label:params.testId, description:params.testDescription, person:person]);
	}
	
	def testUpdatePerson = { PersonEditCommand cmd ->
		def validationFailed = AgentsUtils.validatePerson(grailsApplication, cmd);
		if (validationFailed) {
			println 'problems ' + cmd.errors;
		} else {
			def person = Person.findById(params.id);
			println person
			if(person!=null) {
				person.title = params.title;
				person.firstName = params.firstName;
				person.middleName = params.middleName;
				person.lastName = params.lastName;
				person.affiliation = params.affiliation;
				person.country = params.country;
				person.displayName = params.displayName;
				person.email = params.email;
	
				render (view:'person-show', model:[label:params.testId, description:params.testDescription, person:person]);
				return;
			}
		}
		render (view:'person-edit', model:[label:params.testId, description:params.testDescription, person:cmd]);
	}
	
	def testCreatePerson = {
		render (view:'person-create', model:[label:params.testId, description:params.testDescription]);
	}
	
	def testSavePerson = {PersonCreateCommand cmd ->
		println 'createUser'

		// Validate against custom rules
		def validationFailed = AgentsUtils.validatePerson(grailsApplication, cmd);
		if (validationFailed) {
			println 'problems ' + cmd.errors;
			render (view:'person-create', model:[label:params.testId, description:params.testDescription, person:cmd]);
		} else {
			def person = new Person();
			person.title = params.title;
			person.firstName = params.firstName;
			person.middleName = params.middleName;
			person.lastName = params.lastName;
			person.affiliation = params.affiliation;
			person.country = params.country;
			person.displayName = params.displayName;
			person.email = params.email;
			
			if(!person.save(flush: true)) {
				println 'problems ' + person.errors;
				
				render (view:'person-create', model:[label:params.testId, description:params.testDescription, person:person]);
				return
			} else {
				render (view:'person-show', model:[label:params.testId, description:params.testDescription, person:person]);
				return;
			}
		}
	}
	
	def testListPersons = {
		//params.max = 2;
		render (view:'persons-list', model:[label:params.testId, description:params.testDescription, persons:Person.list(params), personsTotal: Person.count(), 
			max: params.max, offset: params.offset, controller:'tests', action: 'testListPersons']);
	}
	
	private def getPerson(def id) {
		def person;
		if(id==null)  person=Person.list()[0];
		else person = Person.findById(id);
		person
	}
	
	// ------------------------
	//         SOFTWARE
	// ------------------------
	def testShowSoftware = {
		def software = getSoftware(params.id);
		render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
	}
	
	def testShowSoftwareLensNoSoftware = {
		render (view:'software-show', model:[label:params.testId, description:params.testDescription]);
	}
	
	def testEditSoftware = {
		def software = getSoftware(params.id);
		render (view:'software-edit', model:[label:params.testId, description:params.testDescription, software:software]);
	}
	
	def testUpdateSoftware = { SoftwareEditCommand cmd ->
		def validationFailed = AgentsUtils.validateSoftware(grailsApplication, cmd);
		if (validationFailed) {
			println 'problems ' + cmd.errors;
		} else {
			def software = Software.findById(params.id);
			println software
			if(software!=null) {
				software.ver = params.ver;
				software.name = params.name;
				software.displayName = params.displayName;
				software.description = params.description;
	
				render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
				return;
			}
		}
		render (view:'software-edit', model:[label:params.testId, description:params.testDescription, software:cmd]);
	}
	
	def testCreateSoftware = {
		render (view:'software-create', model:[label:params.testId, description:params.testDescription]);
	}
	

	
	private def getSoftware(def id) {
		def software;
		if(id==null)  software=Software.list()[0];
		else software = Software.findById(id);
		software
	}
	
	def testSaveSoftware = {SoftwareCreateCommand cmd ->
		println 'createSoftware'

		// Validate against custom rules
		def validationFailed = AgentsUtils.validateSoftware(grailsApplication, cmd);
		if (validationFailed) {
			println 'problems ' + cmd.errors;
			render (view:'software-create', model:[label:params.testId, description:params.testDescription, person:cmd]);
		} else {
			def software = new Software();
			software.ver = params.ver;
			software.name = params.name;
			software.description = params.description;
			software.displayName = params.displayName;
			
			if(!software.save(flush: true)) {
				println 'problems ' + software.errors;
				
				render (view:'software-create', model:[label:params.testId, description:params.testDescription, software:software]);
				return
			} else {
				render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
				return;
			}
		}
	}
	
	def testListSoftware = {
		//params.max = 1;
		render (view:'software-list', model:[label:params.testId, description:params.testDescription, software:Software.list(params), softwareTotal: Software.count(), 
			max: params.max, offset: params.offset, controller:'tests', action: 'testListSoftware']);
	}
}
