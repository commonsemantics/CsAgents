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
package org.commonsemantics.grails.agents

import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib
import org.commonsemantics.grails.agents.model.AgentUri
import org.commonsemantics.grails.agents.utils.AgentsUtils

/**
 * @author Paolo Ciccarese <paolo.ciccarese@gmail.com>
 */
class AgentsService {

	def grailsApplication;
	
	def validatePerson(def cmd) {
		boolean validationFailed = false;
		def mandatory = AgentsUtils.getPersonDynamicMandatoryFields(grailsApplication);
		log.debug 'Mandatory fields: ' + mandatory
		
		if(!cmd.validate()) {
			log.error 'Person Validation Failed'
			validationFailed=true;
		}
		
		def g = new ValidationTagLib()
		mandatory.each { item ->
			if(!(cmd[item]!=null && cmd[item].trim().length()>0)) {
				log.error('Error for field "' + item + '" which cannot be null')
				//cmd.errors.reject(g.message(code: 'org.commonsemantics.grails.general.message.error.cannotbenull', default: 'Field cannot be null'),
				//	[item, 'class User'] as Object[],
				//	'[Property [{0}] of class [{1}] does not match confirmation]')
				if(cmd.errors[item]==null) // This check if a validation error for this field is already present from previous validation steps
					cmd.errors.rejectValue(item, g.message(code: 'default.blank.message', default: 'Field cannot be null'))
				validationFailed=true;
			}
		}
		validationFailed;
	}
	
	def validateSoftware(def cmd) {
		boolean validationFailed = false;
		def mandatory = AgentsUtils.getSoftwareDynamicMandatoryFields(grailsApplication);
		log.debug('Mandatory fields: ' + mandatory)

		if(!cmd.validate()) {
			log.error 'Software Validation Failed'
			validationFailed=true;
		}
		
		def g = new ValidationTagLib()
		mandatory.each { item ->
			if(!(cmd[item]!=null && cmd[item].trim().length()>0)) {
				log.error('Error for field "' + item + '" which cannot be null')
				//cmd.errors.reject(g.message(code: 'org.commonsemantics.grails.general.message.error.cannotbenull', default: 'Field cannot be null'),
				//	[item, 'class User'] as Object[],
				//	'[Property [{0}] of class [{1}] does not match confirmation]')
				cmd.errors.rejectValue(item, g.message(code: 'default.blank.message', default: 'Field cannot be null'))
				validationFailed=true;
			}
		}
		validationFailed;
	}
	
	def getAgentIdentifiers(def agent) {
		def agentUris = []
		def au = AgentUri.findAllByAgent(agent);
		au.each { agentUris.add(it.uri)}
		agentUris
	}
}
