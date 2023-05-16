<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <div class = "container">
        <div class = row content">
            <h2 style = "text-align: center; margin-bottom: 50px">detail page</h2>
            <form class="form-horizontal col-sm-8" id = "update_form">

                <div class="form-group has-success has-feedback">
                    <label class="col-sm-2 control-label" for="id">ID</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name = "id" id="id" value="${gcust.id}" readonly>
                        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                    </div>
                </div>

                <div class="form-group has-warning has-feedback">
                    <label class="col-sm-2 control-label" for="pwd">Password</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="pwd" name = "pwd" value="${gcust.pwd}">
                        <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
                    </div>
                </div>

                <div class="form-group has-error has-feedback">
                    <label class="col-sm-2 control-label" for="name">name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="name" name = "name" value="${gcust.name}">
                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type = "button" id = "update_btn" class="btn btn-warning">Update</button>
                        <button type = "button" id = "remove_btn" class="btn btn-warning">Remove</button>
                    </div>
                </div>
            </form>
    </div>
    </div>
</div>

