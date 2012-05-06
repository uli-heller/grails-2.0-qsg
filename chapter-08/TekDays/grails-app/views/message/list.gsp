
<%@ page import="tekdays.Message" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li>
                                  <g:link class="create" action="create" params='["event.id":"${event?.id}"]'>
                                    <g:message code="default.new.label" args="[entityName]" />
                                  </g:link>
                                </li>
			</ul>
		</div>
		<div id="list-message" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="subject" title="${message(code: 'message.subject.label', default: 'Subject')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'message.content.label', default: 'Content')}" />
					
						<th><g:message code="message.parent.label" default="Parent" /></th>
					
						<th><g:message code="message.author.label" default="Author" /></th>
					
						<th><g:message code="message.event.label" default="Event" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${messageInstanceList}" status="i" var="messageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "subject")}</g:link></td>
					
						<td>${fieldValue(bean: messageInstance, field: "content")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "parent")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "author")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "event")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${messageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
