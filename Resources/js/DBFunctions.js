function callPageWebMethod(pageMethodUrl, ajaxparams, returnMethod) {
    var myData = JSON.stringify(ajaxparams);

    jQuery.ajax({
        url: pageMethodUrl,
        data: "{parametToUSe: " + myData + "}",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (jsonData) {
            returnMethod(jsonData, ajaxparams.paramOne);
        },
        error: function (request, status, errorThrown) {
            returnMethod({ issue: "an issue occured" }, null);
        }
    });
}

function getBrowserCookie(name) {
    cookievalue = "-1";
    var arrCookies = document.cookie.split(";");
    for (var i = 0; i < arrCookies.length; i++) {
        if (arrCookies[i].split("=")[0].trim() == name) {
            cookievalue = arrCookies[i].split("=")[1].trim();
        }
    }
    return cookievalue;
}

function isNull(value, type) {
    if (value == null) {
        if (type == 1) {
            return "";
        }
        if (type == 2) {
            return "0.00";
        }
    }
    return value;
}