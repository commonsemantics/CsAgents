/*
 * Copyright 2013  Common Semantics (commonsemantics.org)
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
package org.commonsemantics.grails.agents.model


/**
 * @author Paolo Ciccarese <paolo.ciccarese@gmail.com>
 */
class Person extends Agent {

	String email
	
	String title
	String firstName
	String middleName
	String lastName
	String country
	String affiliation
	
	Date dateCreated, lastUpdated
	
	static mandatory = ['displayName']
	static optional = ['title','firstName','middleName','lastName','affiliation','country']

	static constraints = {
		id maxSize: 36
		email blank: false, unique: true, email: true

		title (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		firstName (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		middleName (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		lastName (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		displayName (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		affiliation (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
		country (nullable: true, blank: true, maxSize:NAME_MAX_SIZE)
	}

	static mapping = {
		id generator:'uuid', sqlType: "varchar(36)"
	}
}
