<style>
.cor {
	color: white;
}

.alinhar {
	margin-left: 90%;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Uniadv</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/">In�cio</a></li>
			<li><a href="/clientes">Clientes</a></li>
			<li><a href="/processos">Processos</a></li>
			<li><a href="/usuarios">Usu�rios</a></li>
			<li><a href="#"></a></li>
		</ul>

		<div class="alinhar">
			<p class="cor">Bem-vindo,
				${pageContext.request.userPrincipal.name}</p>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <a class="btn btn-info" role="button"
						onclick="document.forms['logoutForm'].submit()">Logout</a>
				</form>
			</c:if>
		</div>
	</div>


</nav>
