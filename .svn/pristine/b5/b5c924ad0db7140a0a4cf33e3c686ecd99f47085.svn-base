/*2015-11-10   write by lishuang*/
$(document).ready(function() {
$('.fpWrap .fpImg').click(function() {

        var imgBox = $('.bigImgWindow');
        var bigImg = $('<img />');

        var imgH;
        var imgW;
        var winH = $(window).height();
        var winW = $(window).width();

        var src = $(this).attr('src');

        bigImg.attr('src', src).one('load', function() {
            imgW = this.width;
            imgH = this.height;

            imgBox.append(bigImg);

            if (imgH * 4 / 5 > imgW) {
                $('.bg').show();
                if (imgH > winH) {
                    imgBox.css({ 'height': winH + 'px', 'width': (imgW * winH) / imgH + 'px', 'left': (winW - (imgW * winH) / imgH) / 2 + 'px', 'top': '0px' }).show();
                }
                else {
                    imgBox.css({ 'height': imgH + 'px', 'width': imgW + 'px', 'left': (winW - imgW) / 2 + 'px', 'top': (winH - imgH) / 2 + 'px' }).show();
                }


            }
            else {
                $('.bg').show();
                if (imgW > winW) {
                    imgBox.css({ 'height': (imgH * winW) / imgW + 'px', 'width': winW + 'px', 'left': '0px', 'top': (winH - (imgH * winW) / imgW) / 2 }).show();
                }
                else {
                    imgBox.css({ 'height': imgH + 'px', 'width': imgW + 'px', 'left': (winW - imgW) / 2 + 'px', 'top': (winH - imgH) / 2 + 'px' }).show();
                }
            }
        }).each(function() {
            if (this.complete) $(this).load();
        });

    });


    $(document).delegate('.bigImgWindow img', 'click', function() {
        $('.bg').hide();
        $('.bigImgWindow img').remove();
        $('.bigImgWindow').hide();
    });
});