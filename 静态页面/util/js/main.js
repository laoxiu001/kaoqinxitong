/**
 * Created by this on 2018/5/12.
 */



/* 员工详情页面下拉框与密码框的内联 */
$(document).on("change","#typeSelect",function(){     //获取整个网页文档对象（类似的于window.document）
    // alert('value：'+$(this).val());//获取value

    var tid=$(this).val(); //获取选中的value值

    //(tid).appendTo("#.tk");  //把获取到的SELECT值插入到节点里面

    //alert(ids);
    var k='--';
    alert(tid+k+ids);
    //alert('text：'+$(this).find("option:selected").text());//获取选中文本


});
/* 员工详情页面下拉框与密码框的内联 */