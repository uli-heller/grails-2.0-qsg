<%@ page import="tekdays.Message" %>

<g:if test="${messageInstance?.parent}">
	<label for="parent">
		<g:message code="message.parent.label" default="In Reply to:" />
	</label>
	<g:fieldValue bean="${messageInstance?.parent}" field="author"/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="message.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="messageField" id="subject" name="subject" required="" value="${messageInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea class="messageField" name="content" cols="40" rows="5" maxlength="2000" required="" value="${messageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="message.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${tekdays.TekUser.list()}" optionKey="id" required="" value="${messageInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'event', 'error')} required">
  <input type="hidden" name="event.id" value="${messageInstance?.event?.id}" />
</div>
