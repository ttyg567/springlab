<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
</script>
<div class="col-sm-8 text-left">
    <div class = "container">
        <h2 style = "text-align: center; margin-bottom : 10px">CFR1</h2>
        <div style = "display : flex; justify-content: center; align-items: center; margin-bottom : 50px">
        <h2>${result}</h2>

        </div>
        <form action="/cfr1impl" method="post" enctype="multipart/form-data" id = "cfr1_form" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="img">Image:</label>
                <div class="col-sm-4">
                    <input type="file" class="form-control" id="img" name="img" placeholder="Enter id" >
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type = "submit" id = "cfr1_btn" class="btn btn-warning">Submit</button>
                </div>
            </div>
        </form>
    </div>
</div>

