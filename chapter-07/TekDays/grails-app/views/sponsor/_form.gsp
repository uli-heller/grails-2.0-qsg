<%@ page import="tekdays.Sponsor" %>



<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="sponsor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${sponsorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'website', 'error')} required">
	<label for="website">
		<g:message code="sponsor.website.label" default="Website" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="website" required="" value="${sponsorInstance?.website}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sponsor.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${sponsorInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="sponsor.logo.label" default="Logo" />
		
	</label>
	<input type="file" id="logo" name="logo" />
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'sponsorships', 'error')} ">
	<label for="sponsorships">
		<g:message code="sponsor.sponsorships.label" default="Sponsorships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sponsorInstance?.sponsorships?}" var="s">
    <li><g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sponsorship" action="create" params="['sponsor.id': sponsorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sponsorship.label', default: 'Sponsorship')])}</g:link>
</li>
</ul>

</div>

