# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('#studentName').length > 0 || $('#teacherName').length > 0
    $('#studentName,#teacherName').autocomplete({ source: '/enrollments/users' })

    $('.enrollButton').on 'click', (e) ->
      e.preventDefault()
      user_name = $('#studentName').val() || $('#teacherName').val()
      $.post '/enrollments/enroll', { user_name: user_name }, (data) ->
        if data == true
          $('.usersList').find('li:contains("nenhum aluno associado")').remove()
          $('.usersList').find('li:contains("nenhum professor associado")').remove()
          $('.usersList').append('<li>'+user_name+'</li>')
