document.addEventListener("DOMContentLoaded", function () {
    /*
    Clear checkboxes button
     */
    $("#clear").on("click", function () {
        $("form.filter input:checkbox").prop("checked", false);
        $("#filter").click();
    })

    /*
    Slider offer
     */
    $(".offer-slider").click(function () {
        $("#offer-create").slideToggle();
    })

    /*
    Filter button
     */
    $("#filter").on("click", function () {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
        $.ajax({
            type: 'POST',
            url: '/order/filter',
            data: $("form.filter").serialize(),
            success: function (result) {
                pasteOrders(result);
            },
            error: function (e) {
                alert('Error occured')
            }
        });
    })

    function pasteOrders(result) {
        var ul = $("div.orders ul");
        var li = ul.children().first().clone();
        ul.empty();
        for (var i = 0; i < result.length; i++) {
            modifyOrder(result[i], li, ul);
        }
    }

    function modifyOrder(order, li, ul) {
        li.find("a.btn").attr("href","/order/show/" + order.id);
        li.find("span#created").text(formatDate(order.created));
        var end = li.find("div#end span");
        if (order.hoursTillEnd === 1) {
            end.text("do końca 1 godzina").addClass("red");
        } else if (order.hoursTillEnd <= 24) {
            end.text("do końca " + order.hoursTillEnd + " godziny").addClass("red");
        } else if (order.hoursTillEnd > 24) {
            end.text("koniec " + formatDate(order.end)).removeClass("red");
        }
        var updated = li.find("div.details p");
        if (order.updated === null) {
            updated.text("");
        } else {
            updated.text("Zaktualizowano:" + formatDate(order.updated));
        }
        var categories = "";
        for (var i = 0; i < order.categories.length; i++) {
            categories = categories + order.categories[i].name + " ";
        }
        li.find("div#categories").text("Kategorie " + categories);
        var technologies = "";
        for (var i = 0; i < order.technologies.length; i++) {
            technologies = technologies + order.technologies[i].name + " ";
        }
        li.find("div#technologies").text("Technologie " + technologies);
        ul.append(li);
    }

    function formatDate(time) {
        var date = new Date(time);
        var month = date.getMonth() + 1;
        var day = date.getDate();
        if (month.toString().length === 1) {
            month = "0" + month;
        }
        if (day.toString().length === 1) {
            day = "0" + day;
        }
        return date.getFullYear() + "-" + month + "-" + day + " " + date.getHours() + ":" + date.getMinutes();
    }
});

