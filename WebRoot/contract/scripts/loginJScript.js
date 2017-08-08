$(document).ready(function() {
    $('#useID').focus(function() {
        if ($(this).val() == "请输入帐号") {
            $(this).val("");
        }
    });
    $('#useID').blur(function() {
        if ($(this).val() == "") {
            $(this).val("请输入帐号");
        }
    });

    $('#password').focus(function() {
        if ($(this).val() == "请输入密码") {
            $(this).val("");
        }
    });
    $('#password').blur(function() {
        if ($(this).val() == "") {
            $(this).val("请输入密码");
        }
    });

 /*   $('#loginBtn').click(function() {
        //        IsNull('useID', '请输入帐号');
        //        IsNull('password', '请输入密码');

        window.location.href = 'cMain.htm';

    });*/


    function IsNull(id, str) {
        if ($('#' + id).val() == str) {
            $('#' + id).siblings('.errnotice').show();
        }
        else {
            $('#' + id).siblings('.errnotice').hide();
        }
    }
});