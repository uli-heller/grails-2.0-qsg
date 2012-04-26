<%@ page import="tekdays.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="task.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${taskInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="task.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="5000" value="${taskInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo">
		<g:message code="task.assignedTo.label" default="Assigned To" />
		
	</label>
	<g:select id="assignedTo" name="assignedTo.id" from="${tekdays.TekUser.list()}" optionKey="id" value="${taskInstance?.assignedTo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDate', 'error')} ">
	<label for="dueDate">
		<g:message code="task.dueDate.label" default="Due Date" />
		
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${taskInstance?.dueDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="task.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${tekdays.TekEvent.list()}" optionKey="id" required="" value="${taskInstance?.event?.id}" class="many-to-one"/>
</div>

