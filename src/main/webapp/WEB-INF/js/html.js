var user_open = function () {
    $('.dropdown-btn').off('click');
    $('.dropdown-btn').click(function (j) {
        var dropDown = $(this).next('.dropdown-list');

        $('.dropdown-list').not(dropDown).slideUp();

        if ($(this).hasClass('active-dropdown')) {
            $(this).removeClass('active-dropdown');
        } else {
            $('.dropdown-btn.active-dropdown').removeClass('active-dropdown');
            $(this).addClass('active-dropdown');
        }

        dropDown.stop(false, true).slideToggle();

        j.preventDefault();
    });
};
$(document).ready(function () {
    let body = $('body')
    body.find('.tooltip-container').click(function () {
        $(this).toggleClass('active-dropdown');
        $(this).children('.tooltip').fadeToggle();
    });

    user_open();

//    $('.only-one-checked input').on('change', function() {
//        $('.only-one-checked input').not(this).prop('checked', false);  
//    });
    let sideBlock = body.find('.side-block');
    body.find('.open-btn').click(function () {
        sideBlock.not($(this).parent()).removeClass('is-open');
        $(this).parent(sideBlock).toggleClass('is-open');
    });
    $(document).on('click touchstart', function (e) {
        let container = $(".side-block, .select2-dropdown");
        if (container.has(e.target).length === 0) {
            container.removeClass('is-open');
        }
    });

});
