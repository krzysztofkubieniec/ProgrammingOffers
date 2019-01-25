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
        li.find("a.title").text(order.title).attr("href", "/order/show/" + order.id);
        li.find("span#created").text(time(order.created));
        var end = li.find("div#end span");
        if (order.hoursTillEnd === 1) {
            end.text("do końca 1 godzina").addClass("red");
        } else if (order.hoursTillEnd <= 24) {
            end.text("do końca " + order.hoursTillEnd + " godziny").addClass("red");
        } else if (order.hoursTillEnd > 24) {
            end.text("koniec " + time(order.end));
        }
        ul.append(li);
    }

    function time(time) {
        var date = new Date(time);
        var month = date.getMonth() + 1;
        if (month.toString().length == 1) {
            month = "0" + month;
        }
        return date.getFullYear() + "-" + month + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
    }
});

