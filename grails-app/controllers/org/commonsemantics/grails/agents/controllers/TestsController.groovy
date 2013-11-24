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

	def agentsService;
	
	static defaultAction = "tests"
	
	def tests = {
		render (view:'tests')
	}
	
	// ------------------------------------------------------------------------
	//  PERSONS
	// ------------------------------------------------------------------------
	def testShowPerson = {
		log.debug("[TEST] show-person " + (params.id?("(id:" + params.id + ")"):"(No id specified)"));
		def person = getPerson('show-person', params.id);			
		render (view:'person-show', model:[label:params.testId, description:params.testDescription, person:person]);
	}
	
	private def getPerson(def methodName, def id) {
		if(id==null)  {
			log.debug(	"[TEST] get-person (No id specified, picked a random person)");
			return Person.list()[0];
		} else {
			def person = Person.findById(id);
			if(person) log.debug("[TEST] " + methodName + " " + person + " - " + person.displayName);
			else log.warn("[TEST] " + methodName + " (No person found with id " + params.id + ")");
			return person;
		}
	}
	
	def testShowPersonLensNoPerson = {
		log.warn("[TEST] show-person (No person specified)");	
		render (view:'person-show', model:[label:params.testId, description:params.testDescription]);
	}
	
	def testEditPerson = {
		log.debug("[TEST] edit-person " + (params.id?("(id:" + params.id + ")"):"(No id specified)"));
		def person = getPerson('edit-person', params.id);
		render (view:'person-edit', model:[label:params.testId, description:params.testDescription, person:person]);
	}

	def testUpdatePerson = { PersonEditCommand cmd ->
		def validationFailed = agentsService.validatePerson(cmd);
		if (validationFailed) {
			log.error("[TEST] While Updating Person " + cmd.errors)
		} else {
			def person = Person.findById(params.id);
			log.debug("[TEST] Updating Person " + person)
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
		log.debug("[TEST] create-person")
		render (view:'person-create', model:[label:params.testId, description:params.testDescription]);
	}
	
	def testSavePerson = {PersonCreateCommand cmd ->
		log.debug("[TEST] Creating person")

		// Validate against custom rules
		def validationFailed = agentsService.validatePerson(cmd);
		if (validationFailed) {
			log.error("[TEST] While Creating Person " + cmd.errors)
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
				log.error("[TEST] While Saving new Person " + person.errors)			
				render (view:'person-create', model:[label:params.testId, description:params.testDescription, person:person]);
				return
			} else {
				render (view:'person-show', model:[label:params.testId, description:params.testDescription, person:person]);
				return;
			}
		}
	}
	
	def testListPersons = {
		log.debug("[TEST] list-person max:" + params.max + " offset:" + params.offset)
		//params.max = 2;
		render (view:'persons-list', model:[label:params.testId, description:params.testDescription, persons:Person.list(params), personsTotal: Person.count(), 
			max: params.max, offset: params.offset, controller:'tests', action: 'testListPersons']);
	}
	
	// ------------------------
	//         SOFTWARE
	// ------------------------
	def testShowSoftware = {
		log.debug("[TEST] show-software " + (params.id?("(id:" + params.id + ")"):"(No id specified)"));
		def software = getSoftware('show-software', params.id);
		render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
	}

	private def getSoftware(def methodName, def id) {
		if(id==null)  {
			log.debug(	"[TEST] get-person (No id specified, picked a random person)");
			return Software.list()[0];
		} else {
			def software = Software.findById(id);
			if(software) log.debug("[TEST] " + methodName + " " + software + " - " + software.displayName);
			else log.warn("[TEST] " + methodName + " (No software found with id " + params.id + ")");
			return software;
		}
	}
		
	def testShowSoftwareLensNoSoftware = {
		log.warn("[TEST] show-software (No person specified)");
		render (view:'software-show', model:[label:params.testId, description:params.testDescription]);
	}
	
	def testEditSoftware = {
		log.debug("[TEST] edit-software " + (params.id?("(id:" + params.id + ")"):"(No id specified)"));
		def software = getSoftware('edit-software', params.id);
		render (view:'software-edit', model:[label:params.testId, description:params.testDescription, software:software]);
	}
	
	def testUpdateSoftware = { SoftwareEditCommand cmd ->
		def validationFailed = agentsService.validateSoftware(cmd);
		if (validationFailed) {
			log.error("[TEST] While Updating Software " + cmd.errors)
		} else {
			def software = Software.findById(params.id);
			log.debug("[TEST] Updating Software " + software)
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
		log.debug("[TEST] create-software")
		render (view:'software-create', model:[label:params.testId, description:params.testDescription]);
	}

	def testSaveSoftware = {SoftwareCreateCommand cmd ->
		log.debug("[TEST] Creating software")

		// Validate against custom rules
		def validationFailed = agentsService.validateSoftware(cmd);
		if (validationFailed) {
			log.error("[TEST] While Creating Software " + cmd.errors)
			render (view:'software-create', model:[label:params.testId, description:params.testDescription, person:cmd]);
		} else {
			def software = new Software();
			software.ver = params.ver;
			software.name = params.name;
			software.description = params.description;
			software.displayName = params.displayName;
			
			if(!software.save(flush: true)) {
				log.error("[TEST] While Saving new Software " + software.errors)				
				render (view:'software-create', model:[label:params.testId, description:params.testDescription, software:software]);
				return
			} else {
				render (view:'software-show', model:[label:params.testId, description:params.testDescription, software:software]);
				return;
			}
		}
	}
	
	def testListSoftware = {
		log.debug("[TEST] list-software max:" + params.max + " offset:" + params.offset)
		//params.max = 1;
		render (view:'software-list', model:[label:params.testId, description:params.testDescription, software:Software.list(params), softwareTotal: Software.count(), 
			max: params.max, offset: params.offset, controller:'tests', action: 'testListSoftware']);
	}

}
