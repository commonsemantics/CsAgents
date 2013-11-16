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
		render (view:'persons-list', model:[label:params.testId, description:params.testDescription, persons:Person.list(params), personsTotal: Person.count()]);
	}
	
	def testShowSoftware = {
		def software = getSoftware(params.id);
		render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
	}
	
	
	private def getPerson(def id) {
		def person;
		if(id==null)  person=Person.list()[0];
		else person = Person.findById(id);
		person
	}
	
	private def getSoftware(def id) {
		def software;
		if(id==null)  software=Software.list()[0];
		else software = Software.findById(id);
		software
	}
}
