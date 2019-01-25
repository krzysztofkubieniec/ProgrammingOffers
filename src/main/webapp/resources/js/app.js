document.addEventListener("DOMContentLoaded", function () {
    /*
    Clear checkboxes button
     */
    $("#clear").on("click", function () {
        // localStorage.clear();
        $checkboxes.prop("checked", false);
        $("#filter").click();
    })
    /*
    Filter button
     */
    $("#filter").on("click", function () {
        $.ajax({
            type: 'POST',
            url: '/order/filter',
            data: $("form.filter").serialize(),
            success: function (result) {
                console.log(result);
            },
            error: function (e) {
                alert('Error occured')
            }
        });
    })

});

