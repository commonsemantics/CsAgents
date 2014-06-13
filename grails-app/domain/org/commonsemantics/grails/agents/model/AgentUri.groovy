package org.commonsemantics.grails.agents.model

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder

class AgentUri implements Serializable {
	
	Agent agent
	String type
	String uri

	boolean equals(other) {
		if (!(other instanceof AgentUri)) {
			return false
		}
		other.agent?.id == agent?.id &&
			other.uri?.id == uri?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (agent) builder.append(agent.id)
		if (uri) builder.append(uri.id)
		builder.toHashCode()
	}

	static AgentUri get(long agentId, long uri) {
		find 'from AgentUri where agent.id=:agentId and uri=:uri',
			[agentId: agentId, uri: uri]
	}

	static AgentUri create(Agent agent, String type, String uri, boolean flush = true) {
		new AgentUri(agent: agent, uri: uri, type: type).save(flush: flush, insert: true)
	}

	static boolean remove(Agent agent, String uri, boolean flush = false) {
		AgentUri instance = AgentUri.findByAgentAndUri(agent, uri)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Agent agent) {
		executeUpdate 'DELETE FROM AgentUri WHERE agent=:agent', [agent: agent]
	}

	static void removeAll(String uri) {
		executeUpdate 'DELETE FROM AgentUri WHERE uri=:uri', [uri: uri]
	}

	static mapping = {
		id composite: ['uri', 'agent']
		version false
	}
}
