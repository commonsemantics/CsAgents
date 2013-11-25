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

import org.apache.log4j.Logger
import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib
import org.commonsemantics.grails.agents.model.Person
import org.commonsemantics.grails.agents.model.Software
import org.commonsemantics.grails.utils.LoggingUtils

/**
* @author Paolo Ciccarese <paolo.ciccarese@gmail.com>
*/
class AgentsUtils {

	static Logger log = Logger.getLogger(AgentsUtils.class) // log4j
	
	//-------------------------------------------------------------------------
	// PERSONS
	//-------------------------------------------------------------------------
	static def getPersonConfigurationMandatoryFields(def grailsApplication) {
		def mandatory =[];
		if(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory.size()>0) {
			mandatory.addAll(Eval.me(grailsApplication.config.org.commonsemantics.grails.persons.model.fields.mandatory));
		}
		return mandatory;
	}
	
	static def getPersonDynamicMandatoryFields(def grailsApplication) {
		def mandatory = Person.mandatory.clone();
		mandatory.addAll(getPersonConfigurationMandatoryFields(grailsApplication));
		return mandatory;
	}

	static boolean isPersonFieldRequired(def grailsApplication, def fieldName) {
		// Mandatory fields by dynamic configuration
		def mandatoryByConfiguration = getPersonDynamicMandatoryFields(grailsApplication)		
		// Mandatory fields by static coding
		if(!Person.constraints[fieldName]?.nullable) mandatoryByConfiguration.add(fieldName);
		
		if((isPersonStaticPropertyExisting('mandatory') && fieldName in Person.mandatory) || fieldName in mandatoryByConfiguration) {
			log.debug LoggingUtils.LOG_CONF + ' Person mandatory field: ' + fieldName;
			return true;
		}
		return false;
	}
		
	static def isPersonStaticPropertyExisting(def name) {
		Person.class.declaredFields.find {
			it.name == 'x' && isStatic(it.modifiers)
		}
	}

	//-------------------------------------------------------------------------
	// SOFTWARE
	//-------------------------------------------------------------------------
	static def getSoftwareConfigurationMandatoryFields(def grailsApplication) {
		def mandatory =[];
		if(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory.size()>0) {
			mandatory =  Eval.me(grailsApplication.config.org.commonsemantics.grails.software.model.fields.mandatory);
		}
		return mandatory;
	}
	
	static def getSoftwareDynamicMandatoryFields(def grailsApplication) {
		def mandatory = Software.mandatory.clone();
		mandatory.addAll(getSoftwareConfigurationMandatoryFields(grailsApplication));
		return mandatory;
	}

	static boolean isSoftwareFieldRequired(def grailsApplication, def fieldName) {
		// Mandatory fields by dynamic configuration
		def mandatoryByConfiguration = getSoftwareDynamicMandatoryFields(grailsApplication)
		// Mandatory fields by static coding
		if(!Software.constraints[fieldName]?.nullable) mandatoryByConfiguration.add(fieldName);
		
		if(fieldName in Software.mandatory || fieldName in mandatoryByConfiguration) {
			log.debug LoggingUtils.LOG_CONF + ' Software mandatory field: ' + fieldName;
			return true;
		}
		return false;
	}
		
	static def isSoftwareStaticPropertyExisting(def name) {
		Software.class.declaredFields.find {
			it.name == 'x' && isStatic(it.modifiers)
		}
	}
}