function showBlockUI() {
    blockUI().show();
}

function hideBlockUI() {
    blockUI().hide();
}

function blockUI() {
    return PF('bui');
}

$(function () {
    $("form").submit(function () {
        if (typeof blockUI() !== 'undefined') {
            showBlockUI();
        }
        return true;
    });
});

function copy() {
   var r = document.getElementById("txtcopy");
    r.focus();
    r.select();
    $("#lblNotice").text("Ctr + C : to copy");
    return;
}

function clear() {
    $("#lblNotice").text(" ");
}