<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="cliente"
	action="${url_base}${acao}">
	<form:input path="id" type="hidden" />

	<spring:bind path="nome">
		<div class="form-group ${status.error ? 'has-error' : ''}">
			<form:label path="nome">Nome</form:label>
			<form:input path="nome" type="text" cssClass="form-control" />
			<form:errors path="nome" />
		</div>
	</spring:bind>

	<spring:bind path="telefone">
		<div class="form-group ${status.error ? 'has-error' : ''}">
			<form:label path="telefone">Telefone</form:label>
			<form:input path="telefone" type="text"
				cssClass="form-control telefone" />
			<form:errors path="telefone" />
		</div>
	</spring:bind>

	<spring:bind path="email">
		<div class="form-group ${status.error ? 'has-error' : ''}">
			<form:label path="email">E-mail</form:label>
			<form:input path="email" type="email" cssClass="form-control" />
			<form:errors path="email" />
		</div>
	</spring:bind>

	<spring:bind path="observacao">
		<div class="form-group ${status.error ? 'has-error' : ''}">
			<form:label path="observacao">Observação</form:label>
			<form:textarea path="observacao" rows="5" cssClass="form-control" />
			<form:errors path="observacao" />
		</div>
	</spring:bind>

	<button type="submit" class="btn btn-primary">Enviar Mensagem</button>
</form:form>