function showBlockUI() {
    blockUI().show();
}

function hideBlockUI() {
    blockUI().hide();
}

function blockUI() {
    return PF('bui');
}

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