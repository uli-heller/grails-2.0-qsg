
<%@ page import="tekdays.TekEvent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tekEvent.label', default: 'TekEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tekEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tekEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'tekEvent.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'tekEvent.city.label', default: 'City')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'tekEvent.description.label', default: 'Description')}" />
						<g:sortableColumn property="venue" title="${message(code: 'tekEvent.venue.label', default: 'Venue')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${tekEventInstanceList}" status="i" var="tekEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tekEventInstance.id}">${fieldValue(bean: tekEventInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: tekEventInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: tekEventInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: tekEventInstance, field: "venue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tekEventInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
