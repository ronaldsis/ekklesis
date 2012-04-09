<html>
<head>
<meta name='layout' content='tlogin' />
<title><g:message code="springSecurity.login.title" /></title>
<style>
h4 {
	margin-left: 80px
}
</style>

</head>

<body>
	<div id="header">
		<h1>.: ekklesis :. Inicio</h1>
	</div>
	<div id='login'>
		<div id="login-container">
			<div class='fheader'>
				<h4>Por favor ingrese su usuario y clave</h4>
			</div>

			<g:if test='${flash.message}'>
				<div class='login_message'>
					${flash.message}
				</div>
			</g:if>

			<form action='${postUrl}' method='POST' id='loginForm'
				class='cssform' autocomplete='off'>

				<label for='username'>Usuario:</label> <input type='text'
					class='text_' name='j_username' id='username' /> <label
					for='clave'>Clave:</label> <input
					type='password' class='text_' name='j_password' id='password' />


				<p id="remember_me_holder">
					<input type='checkbox' class='chk' name='${rememberMeParameter}'
						id='remember_me'
						<g:if test='${hasCookie}'>checked='checked'</g:if> /> <label
						for='remember_me'>Recordar</label>
				</p>

				<p>
					<!-- <input type='submit' id="submit"
						value='${message(code: "springSecurity.login.button")}' />  -->
					<input type="submit"
						value="${message(code: "springSecurity.login.button")}"
						class="ui-state-default ui-corner-all button" id="submit" />
				</p>
			</form>
		</div>
	</div>
	<script type='text/javascript'>
	<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
	// -->
	</script>
</body>
</html>
