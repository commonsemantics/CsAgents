import org.commonsemantics.grails.agents.model.Person;

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

    }
	def separator = {
		log.info  '------------------------------------------------------------------------';
	}
    def destroy = {
    }
}
