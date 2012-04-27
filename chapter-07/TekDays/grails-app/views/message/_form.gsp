<%@ page import="tekdays.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="message.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${messageInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="2000" required="" value="${messageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="message.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${tekdays.Message.list()}" optionKey="id" value="${messageInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="message.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${tekdays.TekUser.list()}" optionKey="id" required="" value="${messageInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="message.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${tekdays.TekEvent.list()}" optionKey="id" required="" value="${messageInstance?.event?.id}" class="many-to-one"/>
</div>

