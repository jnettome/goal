# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  # Change users registration form based on user type
  @changeRegistrationForm = (e) ->
    if $('#user_type').val() == 'Student' || $('#student_type').val() == 'Student' || $('#teacher_type').val() == 'Student'
      $('.teacher_field').hide()
    else if $('#user_type').val() == 'Teacher' || $('#student_type').val() == 'Teacher' || $('#teacher_type').val() == 'Teacher'
      $('.teacher_field').show()

  if $('#user_type').length > 0 || $('#student_type').length > 0 || $('#teacher_type').length > 0
    @changeRegistrationForm()
    $('#user_type, #student_type, #teacher_type').on 'change', @changeRegistrationForm


