var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('.btn-images').off('click').on('click', function (e) {
            e.preventDefault();
            $('#imagesManange').modal('show');
            $('#hidProductID').val($(this).data('id'));
        });

        $('#btnChooseImage').off('click').on('click', function (e) {
            e.preventDefault();
            var finder = new CKFinder();
            finder.selectActionFunction = function (url) {
                $('#imageList').append('<img src="' + url + '" width="100"/>');
            };
            finder.popup();

        });
    }

}
product.init();