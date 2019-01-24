document.addEventListener("DOMContentLoaded", function () {
    /*
    Keeping checkboxes checked
     */
    var checkboxValues = JSON.parse(localStorage.getItem('checkboxValues')) || {},
        $checkboxes = $(".filter :checkbox");

    $checkboxes.on("change", function(){
        $checkboxes.each(function(){
            checkboxValues[this.id] = this.checked;
        });

        localStorage.setItem("checkboxValues", JSON.stringify(checkboxValues));
    });

    // On page load
    $.each(checkboxValues, function(key, value) {
        $("#" + key).prop('checked', value);
    });

    /*
    Clear checkboxes button
     */
    $("#clear").on("click",function () {
        localStorage.clear();
        $checkboxes.prop("checked",false);
        $("#filter").click();
    })

});

