let login_form = {
    init : function(){
        $('#login_btn').click(function(){
            login_form.send();
        });
    },
    send : function(){
        $('#login_form').attr({
            'action':'/loginimpl',//MainController로 요청을 보낸다.
            'method':'get'
        });
        $('#login_form').submit();
    }
};
$(function(){
    login_form.init()
});



let jsp01 = {
    data:0,
    init:function(num){
        this.data = num;//자바에서 정의했던 변수들을 js에서도 쓸수 있다.
        //this.data = '<c:out value="${num}"/>'
        this.display();
    },
    display:function(){
        $('#jsp01').text(this.data+'');
    }
};
$(function(){
    jsp01.init();
});