<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    //js에 빼놨음
    //스크립트 언어는 위에서부터 실행되므로 onload가 반드시 필요함.
    // let login_form = {
    //     init : function(){
    //         $('#login_btn').click(function(){
    //             login_form.send();
    //         });
    //     },
    //     send : function(){
    //         $('#login_form').attr({
    //             'action':'/loginimpl',//MainController로 요청을 보낸다.
    //             'method':'get'
    //         });
    //         $('#login_form').submit();
    //     }
    // };
    // $(function(){
    //     login_form.init()
    // });
</script>
<div class="col-sm-8 text-left">
    <div class = "container">
        <h2 style = "text-align: center; margin-bottom : 10px">WELCOME</h2>
        <div style = "display : flex; justify-content: center; align-items: center; margin-bottom : 50px">

        </div>
        <form id = "login_form" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">id:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label><input type="checkbox" name="remember"> Remember me</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type = "button" id = "login_btn" class="btn btn-warning">Login</button>
                </div>
            </div>
        </form>
    </div>
</div>

