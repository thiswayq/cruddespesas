class Despesa
	constructor: ->
		@data = $("#data")
		@hora = $("#hora")
		@description = $("#description")
		@amount = $("#amount")
		@comment = $("#comment")
		@id = $("#id")
		@formulario = $("#task-form")
		@url = "http://localhost:3000/api/despesas/"

	lista_despesas: ->
		self = @
		$.get @url, (retorno) ->
			$('#despesas').text("")
			$.each retorno.despesas, (index, value) ->
				$('#despesas').append("<tr>
					<td>#{value.data}</td>
					<td>#{value.time}</td>
					<td>#{value.description}</td>
					<td>#{value.amount}</td>
					<td>#{value.comment}</td>
					<td><input type='button' id='edit_#{value.id}' value='Editar' class='edit'/></td>
					<td><input type='button' id='destroy_#{value.id}' value='Delete' class='destroy'/></td></tr>")
			$(".destroy").on "click", ->
				id_destroy = "#{@.id}".split("_")[1]
				$.ajax(
					method: "DELETE"
					url: "#{self.url}#{id_destroy}").done (retorno) -> 
				 		console.log retorno
				 		self.lista_despesas()
			$(".edit").on "click", ->
				$("#enviar").hide()
				$("#editar").show()
				id_edit = "#{@.id}".split("_")[1]
				self.formulario.toggle()
				$.get "#{self.url}#{id_edit}", (retorno) ->
					console.log retorno
					self.data.val(retorno.data)
					self.hora.val(retorno.time)
					self.description.val(retorno.description)
					self.amount.val(retorno.amount)
					self.comment.val(retorno.comment)
					self.id.val(retorno.id)
			$("#editar").on "click", ->
				$.ajax(
					method: "PUT"
					url: "#{self.url}#{self.id.val()}"
					data: {data: self.data.val(), time: self.hora.val(), description: self.description.val(), amount: self.amount.val(), comment: self.comment.val()}, (retorno) ->
						console.log retorno)
				self.lista_despesas()
				self.limpa_formulario()
					

	ouvinte_nova_despesa: ->
		self = @
		$(".meu_botao").on "click", ->
			self.formulario.toggle()
			$("#editar").hide()
			$("#enviar").show()

	registro_ouvinte_create: ->
		self = @
		$("#enviar").on "click", ->
			self.create_despesa()

	create_despesa: ->
		self = @
		$.post @url, {data: @data.val(), time: @hora.val(), description: @description.val(), amount: @amount.val(), comment: @comment.val()}, (retorno) ->
			console.log retorno
			self.lista_despesas()
			self.limpa_formulario()
	limpa_formulario: ->
		@data.val("")
		@hora.val("")
		@description.val("")
		@amount.val("")
		@comment.val("")
		@id.val("")
		@formulario.hide()

despesa = new Despesa()
despesa.lista_despesas()
despesa.ouvinte_nova_despesa()
despesa.registro_ouvinte_create()
