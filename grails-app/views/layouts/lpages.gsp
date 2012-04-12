<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Ekklesis - Inicio " /></title>
<!-- stylesheets  -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'style2.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css/theme', file: 'jquery-ui-1.8.2.custom.css')}"
	type="text/css">
<!-- End of styleshets  -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'reset.css')}"
	type="text/css">

<link rel="stylesheet"
	href="${resource(dir: 'css', file: '760.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: '760.margin.css')}"
        type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'text2.css')}"
	type="text/css">




<!-- Scripts  -->
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery-1.4.2.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery-ui-1.8.2.custom.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jQuery.tree.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'cufon-yui.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'Quicksand_Book_400.font.js')}"></script>
<!-- <script type="text/javascript"
	src="${resource(dir: 'js', file: 'raphael-min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'graphix.0.9.min.js')}"></script>-->
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'custom.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.maskedinput-1.3.min.js')}"></script>
<!-- End of Scripts  -->
<g:layoutHead />
<r:layoutResources />

</head>

<body>


	<!-- Start of Message Box, shows when message text is clicked  -->

	<div id="message-box" title="Message Box">

		<h5>Message 1</h5>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Vivamus sit amet ornare lacus.</p>
		<h5>Message 2</h5>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Vivamus sit amet ornare lacus.</p>
		<h5>Message 3</h5>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Vivamus sit amet ornare lacus.</p>

	</div>
	<div id="luix-box" title="Informaci&oacute;n de Usuario">
		<h5>Informaci&oacute;n </h5>
		<p>Nombre:<sec:loggedInUserInfo field="username" /></p>
	</div>
	

	<!-- End of Message Box  -->

	<div id="header">
		<!-- Start of Header -->


		<div id="notice-bar">
			<ul>
				<!--  Start of Tab Controls -->
				<sec:ifLoggedIn>
					<li><a href="#" id='luix-button'> Bienvenido, <sec:username /> :
					</a></li>
					<!-- <li><a href="#" id="message-button"> 3 Messages</a></li> -->
					<li>(<g:link controller="logout">Salir</g:link>)
					</li>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<li><g:link controller="login" action="auth">Ingresar</g:link></li>
				</sec:ifNotLoggedIn>
			</ul>
			<!--  End of Tab Controls -->
		</div>
		<!-- Notice bar at the right side  -->
		<form action="#" method="post" id="search-bar">
			<!-- Start of AutoComplete Search Bar -->
			<fieldset>
				<input type="text" id="search" class=" ui-corner-left" /><input
					type="submit" value=" " id="search_submit" />
			</fieldset>
			<!-- End of Search Bar  -->
		</form>
		<h1>ekklesis</h1>
	</div>
	<!-- End of Header  -->

	<div class="container" id="top-panel">
		<!--  Start of container -->

		<div class=" left-col">
			<!-- Start of Left Column -->
			<!-- <div class="urgent"> -->
			<!-- Start of Urgent Message -->
			<!--	<h6>Attention required</h6>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Vivamus sit amet ornare lacus. Curabitur et lacus ligula. Sed
					euismod lacinia magna tincidunt semper.</p>
			  </div>-->
			<!-- End of Urgent message  -->
		</div>
		<!-- End of Left Column  -->

		<!--  Start of Dock -->
		<g:render template="../menudock" />


		<!--  End  of Dock -->

		<div class="right-col">
			<!--  Start of right column -->
			<div id="calender"></div>
		</div>
		<!--  End  of right --->

		<a href="#" id="dock-control"></a>
		<!--  Button for Sliding Head Panel --->

	</div>
	<!--  End of Head Panel container -->



	<div class="container">
		<!--  Start of container -->
		<div class="left-col">
			<!--  Start of Left Column -->





			
			<!--  End of Widget Box -->


		</div>
		<!--  End of Left Column -->


		<g:layoutBody />

		<div class="right-col">
			<!--  Start of Right Column -->
			<g:render template="../sidemenu" />
			<!-- 
			<div class="ae-widget-sidebar">
				<h4 class="ae-widget-header">Recent Activities</h4>
				<div class="ae-widget-content">

					<ul>
						<li class="expandable">Invoice Recieved
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Vivamus sit amet ornare lacus.</p>
						</li>
						<li class="expandable">Article Published
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Vivamus sit amet ornare lacus.</p>
						</li>
						<li class="expandable">Invoice Sent
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Vivamus sit amet ornare lacus.</p>
						</li>
						<li>Not Expandable</li>
						<li>Image Galery Loaded</li>
						<li>Filter
							<div class="ui-widget">

								<select id="combobox">
									<option value="">Select one...</option>
									<option value="a">asp</option>
									<option value="c">c</option>
									<option value="cpp">c++</option>
									<option value="cf">coldfusion</option>
									<option value="g">groovy</option>
									<option value="h">haskell</option>
									<option value="j">java</option>
									<option value="js">javascript</option>
									<option value="p1">perl</option>
									<option value="p2">php</option>
									<option value="p3">python</option>
									<option value="r">ruby</option>
									<option value="s">scala</option>
								</select>
							</div>

						</li>
					</ul>


				</div>

			</div>
	 -->
			<!--  End of Widget Box -->


<%--			<div class="ae-widget-sidebar">--%>
<%--				--%>
<%--				<h4 class="ae-widget-header">Archives</h4>--%>
<%--				<div class="ae-widget-content">--%>
<%--					<ul class="files">--%>
<%--						<!--  Tree Widget -->--%>
<%--						<li><a href="documents.html">Invoices</a>--%>
<%--							<ul>--%>
<%--								<li><a href="#">2007</a>--%>
<%--									<ul>--%>
<%--										<li><a href="#">ENi.doc</a></li>--%>
<%--										<li><a href="#">Sd-letter.doc</a></li>--%>
<%--										<li><a href="#">GDstry.doc</a></li>--%>
<%--									</ul></li>--%>
<%--								<li><a href="#">2008</a>--%>
<%--									<ul>--%>
<%--										<li><a href="#">Birthday Parties.doc</a></li>--%>
<%--										<li><a href="#">Area Playgrounds.doc</a></li>--%>
<%--									</ul></li>--%>
<%--								<li><a href="#">2009</a>--%>
<%--									<ul>--%>
<%--										<li><a href="#">Potential Places.doc</a></li>--%>
<%--										<li><a href="#">Travel Funds.doc</a></li>--%>
<%--									</ul></li>--%>
<%--								<li><a href="#">2010</a>--%>
<%--									<ul>--%>
<%--										<li><a href="#">Guests.doc</a></li>--%>
<%--										<li><a href="#">Services.doc</a></li>--%>
<%--									</ul></li>--%>
<%--							</ul></li>--%>
<%--						<li><a href="#">Projects</a>--%>
<%--							<ul>--%>
<%--								<li><a href="#">The Big Lebowski.m4v</a></li>--%>
<%--								<li><a href="#">Planet Earth.m4v</a></li>--%>
<%--							</ul></li>--%>
<%--						<li><a href="#">Logs</a>--%>
<%--							<ul>--%>
<%--								<li><a href="#">Bloc Party - Pioneers.mp3</a></li>--%>
<%--								<li><a href="#">Fleet Foxes - Blue Ridge Mountains.mp3</a></li>--%>
<%--							</ul></li>--%>
<%--						<li><a href="#">My Photos</a>--%>
<%--							<ul>--%>
<%--								<li><a href="#">yellow-flower.jpg</a></li>--%>
<%--								<li><a href="#">orange-flower.jpg</a></li>--%>
<%--								<li><a href="#">red-flower.jpg</a></li>--%>
<%--								<li><a href="#">white-flower.jpg</a></li>--%>
<%--								<li><a href="#">bumblebees.jpg</a></li>--%>
<%--							</ul></li>--%>
<%--					</ul>--%>
<%----%>
<%--				</div>--%>
<%----%>
<%--			</div>--%>
			<!--  End of Widget Box -->


		</div>
		<!--  End of Right Column -->
	</div>
	<!--  End of container -->


	<g:javascript library="application" />

	<r:layoutResources />
</body>
</html>