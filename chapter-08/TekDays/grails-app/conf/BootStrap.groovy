class BootStrap {

    def init = { servletContext ->
         new tekdays.TekUser(fullName: 'John Doe',
                     userName: 'jdoe', 
                     password: 't0ps3cr3t', 
                     email:    'jdoe@johnsgroovyshop.com', 
                     website:  'blog.johnrgroovyshow.com', 
                     bio:    '''John has been programming for over 40 years. He 
has worked
                                with every programming language known to man and
 has settled
                                on Groovy. In his spare time, John dabbles into 
astro physics
                                and plays shuffleboard.'''
                    ).save() 
         new tekdays.TekUser(fullName: 'John Deere',
                     userName: 'tractorman', 
                     password: 't0ps3cr3t', 
                     email:    'john.deere@portproducers.org',
                     website:  'www.perl.porkproducers.org', 
                     bio:    '''John is a top notch Perl programmer and a pretty good
                                hand around the farm. If he can't program it he can
                                plow it!'''
                    ).save()

         def event1 = new tekdays.TekEvent(name: 'Gateway Code Camp',
                                   city: 'Saint Louis, MO',
                                   organizer: tekdays.TekUser.findByFullName('John Doe'),
                                   venue: 'TBD',
                                   startDate: new Date('9/19/2009'),
                                   endDate: new Date('9/19/2009'),
                                   description: '''This conference will bring coders from
                                                   accross platforms, languages, and industries
                                                   together for an exciting day of tips, tricks,
                                                   and tech! Stay sharp! Stay at the top of your
                                                   game! But, don't stay home! Come and join us
                                                   this fall for the first annual Gateway Code
                                                   Camp.''')
         if (!event1.save()) {
             event1.errors.allErrors.each{error ->
                 println "An error occured with event1: ${error}"
             }
         }
         def event2 = new tekdays.TekEvent(name: 'Perl before Swine',
                                   city: 'Austin, MN',
                                   organizer: tekdays.TekUser.findByFullName('John Deere'),
                                   venue: 'SPAM Museum',
                                   startDate: new Date('9/1/2009'),
                                   endDate: new Date('9/1/2009'),
                                   description: '''Join the Perl programmers of the Pork Producers
                                                   of America as we hone out skills and ham it up
                                                   a bit. You can show off your programming chops
                                                   while trying to win a year's supply of pork
                                                   chops in our programming challenge.
                                                   
                                                   Come and join us in historic (and aromatic),
                                                   Austin, Minnesota. You'll know when you're
                                                   there!''')
         if (!event2.save()) {
             event2.errors.allErrors.each{error ->
                 println "An error occured with event2: ${error}"
             }
         }
         def g1 = tekdays.TekEvent.findByName('Gateway Code Camp')
         g1.addToVolunteers(
             new tekdays.TekUser(fullName: 'Sarah Martin',
                         userName: 'sarah',
                         password: '54321',
                         email:    'sarah@martinworld.com',
                         website:  'www.martinworld.com',
                         bio:      'Web designer and Grails afficianado.')
         )
         g1.addToVolunteers(
             new tekdays.TekUser(fullName: 'Bill Smith',
                         userName: 'Mr_Bill',
                         password: '12345',
                         email:    'mrbill@email.com',
                         website:  'www.mrbillswebsite.com',
                         bio:      'Software developer, claymation artist.')
         )
         g1.addToRespondents('ben@grailsmail.com')
         g1.addToRespondents('zachary@linuxgurus.org')
         g1.addToRespondents('solomon@bootstrapwelding.com')
         g1.save()
         def s1 = new tekdays.Sponsor(name: 'Contegix',
                              website: 'contegix.com',
                              description: 'Beyond Managed Hosting for your Enterprise').save()
         def s2 = new tekdays.Sponsor(name: 'Object Computing International',
                              website: 'ociweb.com',
                              description: 'An OO Software Engineering Company').save()
         def sp1 = new tekdays.Sponsorship(event:g1,
                                   sponsor:s1,
                                   contributionType:'Other',
                                   description:'Cool T-Shirts')
         def sp2 = new tekdays.Sponsorship(event:g1,
                                   sponsor:s2,
                                   contributionType:'Venue',
                                   description:'Will be paying for the Moscone')
         s1.addToSponsorships(sp1)
         s1.save()
         s2.addToSponsorships(sp2)
         s2.save()
         g1.addToSponsorships(sp1)
         g1.addToSponsorships(sp2)
         g1.save()

    }
    def destroy = {
    }
}
