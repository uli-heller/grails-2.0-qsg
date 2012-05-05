
<%@ page import="tekdays.Sponsor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sponsor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sponsor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sponsor">
			
				<g:if test="${sponsorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="sponsor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sponsorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sponsorInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="sponsor.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${sponsorInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sponsorInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="sponsor.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${sponsorInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sponsorInstance?.logo}">
				<li class="fieldcontain">
					<span id="logo-label" class="property-label"><g:message code="sponsor.logo.label" default="Logo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sponsorInstance?.sponsorships}">
				<li class="fieldcontain">
					<span id="sponsorships-label" class="property-label"><g:message code="sponsor.sponsorships.label" default="Sponsorships" /></span>
					
						<g:each in="${sponsorInstance.sponsorships}" var="s">
						<span class="property-value" aria-labelledby="sponsorships-label"><g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sponsorInstance?.id}" />
					<g:link class="edit" action="edit" id="${sponsorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
