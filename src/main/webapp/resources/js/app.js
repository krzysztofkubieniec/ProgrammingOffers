document.addEventListener("DOMContentLoaded", function () {
    var filterCheckboxes = $("form.filter input:checkbox");
    var paginationCheckboxes = $("form.pageination input:radio");
    /*
    Clear checkboxes button
     */
    $("#clear").on("click", function () {
        checkboxes.prop("checked", false);
        ajaxRequest();
    })

    /*
    Filter button
     */
    filterCheckboxes.on("click", function () {
        var firstPageLi = $("ul.pagination").children().first();
        firstPageLi.find("input").prop("checked",true);
        ajaxFilter();

    });

    /*
    Page change button
     */
    paginationCheckboxes.on("click",function () {
    console.log("pah!");
    });

    function pasteOrders(result) {
        var ul = $("div.orders ul").first();
        var li = ul.children().first().clone(true);
        ul.empty();
        for (var i = 0; i < result.content.length; i++) {
            modifyOrder(result.content[i], li, ul);
        }
    }

    function modifyOrder(order, li, ul) {
        var newLi = li.clone(true);
        newLi.find("a.title").text(order.title);
        newLi.find("div.content").text(order.shortenContent).append("<a href = '/order/show/" + order.id + "' class='btn btn-link rfp-show-details'> Pokaż więcej <i class = 'fa fa-angle-right'> </i></a>");
        newLi.find("a.btn").attr("href", "/order/show/" + order.id);
        newLi.find("span#created").text(formatDate(order.created));
        var end = newLi.find("div#end span");
        if (order.hoursTillEnd === 1) {
            end.text("do końca 1 godzina").addClass("red");
        } else if (order.hoursTillEnd <= 24) {
            end.text("do końca " + order.hoursTillEnd + " godziny").addClass("red");
        } else if (order.hoursTillEnd > 24) {
            end.text("koniec " + formatDate(order.end)).removeClass("red");
        }
        var updated = newLi.find("div.details p");
        if (order.updated === null) {
            updated.text("");
        } else {
            updated.text("Zaktualizowano:" + formatDate(order.updated));
        }
        var categories = "";
        for (var i = 0; i < order.categories.length; i++) {
            categories = categories + order.categories[i].name + " ";
        }
        newLi.find("div#categories").text("Kategorie " + categories);
        var technologies = "";
        for (var i = 0; i < order.technologies.length; i++) {
            technologies = technologies + order.technologies[i].name + " ";
        }
        newLi.find("div#technologies").text("Technologie " + technologies);
        ul.append(newLi);
    }

    function pastePaging(pageNo, totalPages) {
        var ul = $('ul.pagination');
        var li = ul.children().first().clone(true);
        ul.empty();
        for (var i = 0; i < totalPages; i++) {
            var newLi = li.clone(true);
            newLi.find("input").attr("id", "c" + i).attr("value", i);
            newLi.find("label").attr("for", "c" + i).text(i + 1);
            newLi.find("span").remove();
            if (i === pageNo) {
                newLi.find("input").append("<span class=\'sr-only\'>(current)</span>").prop("checked", true);
            }
            ul.append(newLi);
        }

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

    /*
    Slider offer
     */
    $(".offer-slider").click(function () {
        $("#offer-create").slideToggle();
    })

    /*
    Ajax request for orders
     */
    function ajaxFilter() {
        $.ajax({
            type: 'POST',
            url: '/order/filter',
            data: $("form.filter").serialize(),
            success: function (result) {
                pasteOrders(result);
                pastePaging(result.number, result.totalPages);
                firstPageLi = $("ul.pagination").children().first();
                firstPageLi.find("input").prop("checked",true);
            },
            error: function (e) {
                alert('Error occured')
            }
        });
    }
});

