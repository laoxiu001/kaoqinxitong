//清除密码修改 span 提示文字
function resetPassword () {
    document.getElementById("span_password").innerHTML='';
    document.getElementById("span_newPassword_1").innerHTML='';
    document.getElementById("span_newPassword_2").innerHTML='';
};
//修改密码执行表单验证
function changePassword() {
    resetPassword();
    var oldPassword = document.getElementById('password').value;
    var newPassword_1 = document.getElementById('newPassword_1').value;
    var newPassword_2 = document.getElementById('newPassword_2').value;
    if (oldPassword == ""){
        document.getElementById("span_password").innerHTML='请输入当前密码';
        return false;
    }else if (newPassword_1 == ""){
        document.getElementById("span_newPassword_1").innerHTML='请输入密码';
        return false;
    }else if (newPassword_1.length < 8){
        document.getElementById("span_newPassword_1").innerHTML='密码不可少于8位';
        return false;
    }else if (newPassword_2 == ""){
        document.getElementById("span_newPassword_2").innerHTML='请确认密码';
        return false;
    }else if (newPassword_1 != newPassword_2){
        document.getElementById("span_newPassword_2").innerHTML='两次密码不一致';
        return false;
    }
    return true;
}
//全局弹出信息
function reset(){
    $("toggleCSS").href = "css/alertify.core.css";
    alertify.set({
        labels: {
            ok: "OK",
            cancel: "Cancel"
        },
        delay: 5000,
        buttonReverse: false,
        buttonFocus: "ok"
    });
};
function message(){
    /* 全局定义变量 message */
    result = 'success';
    message = '登陆成功'
    if(result != '' && message != ''){
        if(result == 'success'){
            reset();
            alertify.success(message);
            result = '';
            message = ''
        }else if(result == 'error'){
            reset();
            alertify.error(message);
            result = '';
            message = ''
        }
    }
};
//punch.html打卡测试页面JS
function punch_search() {
    //清空span内容
    document.getElementById("span_search").innerHTML='';
    var number = document.getElementById('search_number').value;
    if (number == ""){
        document.getElementById("span_search").innerHTML='员工工号为空';
        return false;
    }
    return true;
}
function punch() {
    //清空span内容
    document.getElementById("span_punch").innerHTML='';
    var number = document.getElementById('inf_number').value;
    if (number == ""){
        document.getElementById("span_punch").innerHTML='员工工号为空';
        return false;
    }
    return true;
}
