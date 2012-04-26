class BootStrap {

    def init = { servletContext ->
         def event1 = new tekdays.TekEvent(name: 'Gateway Code Camp',
                                   city: 'Saint Louis, MO',
                                   organizer: 'John Doe',
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
                                   organizer: 'John Deere',
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
    }
    def destroy = {
    }
}
