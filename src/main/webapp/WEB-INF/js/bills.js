$(document).ready(function () {

    let body = $('body');
//    let body = $("#send-iframe").contents();

    function calc() {

        let table = body.find('table#main-table');

        let dopTableOne = body.find('table#dop-table-one');
        let dopTableTwo = body.find('table#dop-table-two');

        let allSum = 0, allSumWithOutTax = 0, allTax = 0;

        table.find('tbody tr:not(.template)').each(function (i) {

            console.log($(this));

            let count = Number($(this).find('td.main-td.serviceCount span').text());

            if (!count) {
                count = 1;
            }

            let price = Number($(this).attr('data-serviceprice')) * count, allPrice = 0;
            if (price) {
                $(this).find('td.main-td.servicePrice span').text(price);

                allSumWithOutTax += price;
                var nds = $("#select-nds").val();
                console.log(nds);
                let tax = Number((price * nds) / 100);

                allTax += tax;

                allPrice = Number((price + tax).toFixed(2));

                $(this).find('td.main-td.serviceTax span').text(tax);
                $(this).find('td.main-td.serviceResult span').text(allPrice);

                allSum += allPrice;
            }
        });

        dopTableOne.find('td.all-sum-with-out-nds span').text(allSumWithOutTax.toFixed(2));
        dopTableOne.find('td.all-tax span').text(allTax.toFixed(2));
        dopTableOne.find('td.all-sum span').text(allSum.toFixed(2));

        dopTableTwo.find('td.all-tax span').text(allTax.toFixed(2));
        dopTableTwo.find('td.all-sum-with-out-nds span').text(allSumWithOutTax.toFixed(2));

    }

    $(document).on('click', 'button.remove-field', function () {
        var dataRow = $(this).closest('.service').attr('data-row');
        $('div.service[data-row=' + dataRow + '], tr.main-table-tr[data-row=' + dataRow + ']').remove();
    });


    $(document).on('keyup', '.service-enter', function () {

        let index = $(this).closest('div.service').attr('data-row');

        //let prize = $("#billsForm input[name='billsServicesForm[" + index + "].servicePrice']").val();

        //console.log(prize);
        body.find('tr.main-table-tr[data-row=' + index + ']').attr('data-' + $(this).attr('data-class'), $(this).val()).find('.' + $(this).attr('data-class') + ' span').text($(this).val());

        body.find('div#client-info').attr('data-' + $(this).attr('data-class'), $(this).val()).find('.' + $(this).attr('data-class') + ' span').text($(this).val());
        body.find('tr#client-info-ukr').attr('data-' + $(this).attr('data-class'), $(this).val()).find('.' + $(this).attr('data-class') + ' span').text($(this).val());

        if ($(this).attr('type') === 'number') {
            calc();
        }
    });
    $(document).on('change', '.service-enter', function () {

        body.find('div#client-info').attr('data-' + $(this).attr('data-class'), $(this).val()).find('.' + $(this).attr('data-class') + ' span').text($(this).val());

    });

    $('.add-field').click(function () {

        let index = body.find('div.service:not(.template)').length;

        var newService = body.find('div.service.template').clone().removeClass('template hidden').attr('data-row', index);
        var newField = body.find('tr.main-table-tr.template').clone().removeClass('template hidden').attr('data-row', index);

        newService.find('.add-btn').addClass('remove-field').text('-');
        newService.find('.service-enter').each(function () {
            $(this).attr('name', 'billsServicesForm[' + index + '].' + $(this).attr('data-class'));
        });

        $('.services').append(newService);
        $('#main-table tbody').append(newField);
        $('.main-table-tr .first-td').each(function (index) {
            var rowNumber = $(this).parent('.main-table-tr').attr('data-row');
            rowNumber++;
            $(this).text(rowNumber);
        });
    });


    $(document).on('keyup', 'input.enter', function (e) {
        let target = $(this).attr('data-target');
        $('p.' + target).text($(this).val());
    });
});