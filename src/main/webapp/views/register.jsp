<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let register_form = {
    init:function(){
      $('#register_btn').click(function(){
        register_form.send();
      });
    },
    send:function(){
      //submit login_form to server
      $('#register_form').attr({
        'action':'/registerimpl',
        'method':'get'
      });
      $('#register_form').submit();

    }
  };
  $(function(){
    register_form.init();
  });
</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <div class="row contents">
      <div class="col-sm-8 text-left">
        <h1>Login Page</h1>
        <form id="register_form" class="form-horizontal well">
          <div class="form-group">
            <label class="control-label col-sm-2" for="id">ID:</label>
            <div class="col-sm-10">
              <input type="text" name="id" class="form-control" id="id" placeholder="Enter ID">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>
            <div class="col-sm-10">
              <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="name">Name: </label>
            <div class="col-sm-10">
              <input type="text" name="name" class="form-control" id="name" placeholder="Enter name">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button id="register_btn" type="button" class="btn btn-default">Register</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
