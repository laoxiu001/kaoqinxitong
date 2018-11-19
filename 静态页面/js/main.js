//清除密码修改 span 提示文字
function resetPassword () {
    document.getElementById("span_password").innerHTML='';
    document.getElementById("span_newPassword_1").innerHTML='';
    document.getElementById("span_newPassword_2").innerHTML='';
};
//清除密码修改 input 输入框
function resetPasswordInput () {
    document.getElementById("password").value='';
    document.getElementById("newPassword_1").value='';
    document.getElementById("newPassword_2").value='';
};
//隐藏修改密码模态框时清除span
$('#myModal').on('hide.bs.modal', function () {
    resetPassword();
    resetPasswordInput();
})
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
function resetMessage(){
    /* 全局定义变量 message */
    result = 'success';
    message = '登陆成功';
}
function message(result,message){
    /* 全局定义变量 message */
    if(result != '' && message != ''){
        if(result == 'success'){
            resetMessage();
            alertify.success(message);
            result = '';
            message = ''
        }else if(result == 'error'){
            resetMessage();
            alertify.error(message);
            result = '';
            message = ''
        }
    }
};
function dateFormat(time) {
    /*
     * 时间格式化
     * 转换前格式：2017-10-10 08:08
     * 转换后：2017-10-10T08:08
     * */
    time = time.replace(' ','T');
    return time;
};
