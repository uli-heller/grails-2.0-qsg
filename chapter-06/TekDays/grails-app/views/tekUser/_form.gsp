<%@ page import="tekdays.TekUser" %>



<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'fullName', 'error')} ">
	<label for="fullName">
		<g:message code="tekUser.fullName.label" default="Full Name" />
		
	</label>
	<g:textField name="fullName" value="${tekUserInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="tekUser.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${tekUserInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="tekUser.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${tekUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="tekUser.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${tekUserInstance?.website}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'bio', 'error')} ">
	<label for="bio">
		<g:message code="tekUser.bio.label" default="Bio" />
		
	</label>
	<g:textArea name="bio" cols="40" rows="5" maxlength="5000" value="${tekUserInstance?.bio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="tekUser.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${tekUserInstance?.password}"/>
</div>

