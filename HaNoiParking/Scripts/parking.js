//Load Data in Table when documents is ready  
$(document).ready(function () {
    loadData();
});

//Load Data function  
function loadData() {
    $.ajax({
        url: "Home/List",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $.each(result, function (key, item) {
                console.log(item);
            });
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
