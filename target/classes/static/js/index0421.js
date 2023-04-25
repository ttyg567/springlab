let login_form = {
    init:function(){
        $('#login_btn').click(function(){
            login_form.send();
        });
    },
    send:function(){
        // login_form 을 서버로 보낸다, this 안써도 됨
        $('#login_form').attr({
            'action':'/loginimpl',
            'method':'post'
        });
        $('#login_form').submit();

    }
};

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

let jsp01 = {
    data:0,
    init: function(num){
        this.data = num;
        //this.data = 'test';
        //this.data = '<c:out value="${num}"/>';
        this.display();
    },
    display: function(){
        $('#jsp01').text(this.data+'');
    }
};