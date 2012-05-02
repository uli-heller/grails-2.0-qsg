<%@ page import="tekdays.TekEvent" %>



<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="tekEvent.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tekEventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="tekEvent.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${tekEventInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="tekEvent.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${tekEventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'organizer', 'error')} required">
	<label for="organizer">
		<g:message code="tekEvent.organizer.label" default="Organizer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organizer" name="organizer.id" from="${tekdays.TekUser.list()}" optionKey="id" required="" value="${tekEventInstance?.organizer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'venue', 'error')} ">
	<label for="venue">
		<g:message code="tekEvent.venue.label" default="Venue" />
		
	</label>
	<g:textField name="venue" value="${tekEventInstance?.venue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="tekEvent.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${tekEventInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="tekEvent.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${tekEventInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'volunteers', 'error')} ">
	<label for="volunteers">
		<g:message code="tekEvent.volunteers.label" default="Volunteers" />
		
	</label>
	<g:select name="volunteers" from="${tekdays.TekUser.list()}" multiple="multiple" optionKey="id" size="5" value="${tekEventInstance?.volunteers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'sponsorships', 'error')} ">
	<label for="sponsorships">
		<g:message code="tekEvent.sponsorships.label" default="Sponsorships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tekEventInstance?.sponsorships?}" var="s">
    <li><g:link controller="sponsorship" action="show" id="${s.id}">${s?.sponsor?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sponsorship" action="create" params="['tekEvent.id': tekEventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sponsorship.label', default: 'Sponsorship')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="tekEvent.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tekEventInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['tekEvent.id': tekEventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="tekEvent.messages.label" default="Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tekEventInstance?.messages?}" var="m">
    <li><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="message" action="create" params="['tekEvent.id': tekEventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tekEventInstance, field: 'respondents', 'error')} ">
	<label for="respondents">
		<g:message code="tekEvent.respondents.label" default="Respondents" />
		
	</label>
	
</div>

