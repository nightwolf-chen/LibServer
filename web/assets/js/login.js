/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function check(user)
{
    if (user)
    {
        alert("登陆成功\n" + user.username + "\n" + user.password);
    }
    else
    {
        alert("登录失败");
    }
}
function login()
{
    var userMap = {};//form1.username.value
    userMap.username = $.md5(form1.username.value);
    userMap.password = $.md5(form1.password.value);
    // alert(userMap.username + "\n" + userMap.password);
    //var s=$.md5(form1.username.value);
    alert(userMap.username+"\n"+userMap.password);
    UserOperator.findUser(userMap, check);
}