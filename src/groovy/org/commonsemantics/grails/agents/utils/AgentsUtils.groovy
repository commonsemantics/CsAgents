/*
 * Copyright 2013 Common Semantics  (commonsemantics.org)
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
package org.commonsemantics.grails.agents.utils

import static java.lang.reflect.Modifier.isStatic

import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib
import org.commonsemantics.grails.agents.model.Person
import org.commonsemantics.grails.agents.model.Software

/**
* @author Paolo Ciccarese <paolo.ciccarese@gmail.com>
*/
class AgentsUtils {

	static boolean isPersonFieldMandatory(def grailsApplication, def fieldName) {
		// Mandatory fields by configuration
		def mandatoryByConfiguration;
		if(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory.size()>0) {
			mandatoryByConfiguration =  Eval.me(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory);
			// Mandatory fields by coding
			if(!Person.constraints[fieldName]?.nullable) mandatoryByConfiguration.add(fieldName);
		}
		if(fieldName in Person.mandatory || fieldName in mandatoryByConfiguration) {
			println 'mandatory: ' + fieldName;
			return true;
		}
		return false;
	}
	
	static def getPersonMandatoryFields(def grailsApplication) {
		def mandatory = Person.mandatory.clone();
		if(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory.size()>0) {
			mandatory.addAll(Eval.me(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory));
		}
		return mandatory;
	}
	
	static def isStaticPersonPropertyExisting(def name) {
		Person.class.declaredFields.find {
			it.name == 'x' && isStatic(it.modifiers)
		}
	}
	
	static def validatePerson(def grailsApplication, def cmd) {
		boolean validationFailed = false;
		def mandatory = AgentsUtils.getPersonMandatoryFields(grailsApplication);
		println mandatory

		if(!cmd.validate()) {
			println 'validationFailed'
			validationFailed=true;
		}
		
		def g = new ValidationTagLib()
		mandatory.each { item ->
			if(!(cmd[item]!=null && cmd[item].trim().length()>0)) {
				println 'problem ' + item;
				//cmd.errors.reject(g.message(code: 'org.commonsemantics.grails.general.message.error.cannotbenull', default: 'Field cannot be null'),
				//	[item, 'class User'] as Object[],
				//	'[Property [{0}] of class [{1}] does not match confirmation]')
				cmd.errors.rejectValue(item,
					g.message(code: 'default.blank.message', default: 'Field cannot be null'))
				validationFailed=true;
			}
		}
		validationFailed;
	}
	
	static boolean isSoftwareFieldMandatory(def grailsApplication, def fieldName) {
		// Mandatory fields by configuration
		def mandatoryByConfiguration;
		if(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory.size()>0) {
			mandatoryByConfiguration =  Eval.me(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory);
			// Mandatory fields by coding
			if(!Software.constraints[fieldName]?.nullable) mandatoryByConfiguration.add(fieldName);
		}
		
		if(fieldName in Software.mandatory || fieldName in mandatoryByConfiguration) {
			println 'mandatory: ' + fieldName;
			return true;
		}
		return false;
	}
	
	static def getSoftwareMandatoryFields(def grailsApplication) {
		def mandatory = Software.mandatory.clone();
		if(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory.size()>0) {
			mandatory.addAll(Eval.me(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory));
		}
		return mandatory;
	}
	
	static def isStaticSoftwarePropertyExisting(def name) {
		Software.class.declaredFields.find {
			it.name == 'x' && isStatic(it.modifiers)
		}
	}
	
	static def validateSoftware(def grailsApplication, def cmd) {
		boolean validationFailed = false;
		def mandatory = AgentsUtils.getSoftwareMandatoryFields(grailsApplication);
		println mandatory

		if(!cmd.validate()) {
			println 'validationFailed'
			validationFailed=true;
		}
		
		def g = new ValidationTagLib()
		mandatory.each { item ->
			if(!(cmd[item]!=null && cmd[item].trim().length()>0)) {
				println 'problem ' + item;
				//cmd.errors.reject(g.message(code: 'org.commonsemantics.grails.general.message.error.cannotbenull', default: 'Field cannot be null'),
				//	[item, 'class User'] as Object[],
				//	'[Property [{0}] of class [{1}] does not match confirmation]')
				cmd.errors.rejectValue(item,
					g.message(code: 'default.blank.message', default: 'Field cannot be null'))
				validationFailed=true;
			}
		}
		validationFailed;
	}
}