import org.commonsemantics.grails.agents.model.Person
import org.commonsemantics.grails.agents.model.Software

class BootStrap {

	def grailsApplication
	
    def init = { servletContext ->
		
		separator();
		log.info  '>> PERSONS'
		
		separator();
		def email = 'paolo.ciccarese@gmail.com';
		log.info  '** Person ' + email
		def person = Person.findByEmail(email);
		if(person==null) {
			person = new Person(
				firstName: 'Jack', 
				lastName: 'White',
				displayName: 'Dr. White',
				email: email
			).save(failOnError: true);
		}	
		
		separator();
		def name = 'Software Test';
		log.info  '** Software ' + name
		def software = Software.findByName(name);
		if(software==null) {
			software = new Software(
				ver: '1.0',
				name: name,
				displayName: 'Software Test display',
				description: 'Software Test description'
			).save(failOnError: true);
		}
		
		separator();
    }
	def separator = {
		log.info  '------------------------------------------------------------------------';
	}
    def destroy = {
    }
}
