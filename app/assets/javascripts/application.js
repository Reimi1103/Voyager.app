// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery3
//= require rails-ujs
//= require activestorage
// require turbolinks
//= require leaflet
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
// require tree .

//---------スライダー------//
$(document).ready(function(){
  $('.post_slick').slick({
    dots: true,
    arrows: true,
    adaptiveHeight: true,
    variableWidth: true,
  });
});

//---------- 画像プレビュー -------//

$(function(){
  $fileField = $('#file')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
        $("#img_field img").wrap('<div class="showtrim"></div>');
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

//---------- 画像プレビュー -------//

$(function(){
  $fileField = $('#file_image1')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field1");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
        $("#img_field1 img").wrap('<div class="showtrim"></div>');
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

//---------- 画像プレビュー -------//

$(function(){
  $fileField = $('#file_image2')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field2");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
        $("#img_field2 img").wrap('<div class="showtrim"></div>');
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

//---------- 画像プレビュー -------//

$(function(){
  $fileField = $('#file_image3')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field3");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
        $("#img_field3 img").wrap('<div class="showtrim"></div>');
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// 長い文章を省略 //
$(function() {
  var count = 100;
$('.text_overflow').each(function() {
  var thisText = $(this).text();
  var textLength = thisText.length;
    if (textLength > count) {
        var showText = thisText.substring(0, count);
        var hideText = thisText.substring(count, textLength);
        var insertText = showText;
      insertText += '<span class="hide">' + hideText + '</span>';
        insertText += '<span class="omit">…</span>';
        insertText += '<a href="" class="more" style="color:blue;">もっと見る</a>';
        $(this).html(insertText);
    };
});
$('.text_overflow .hide').hide();
$('.text_overflow .more').click(function() {
  $(this).hide()
      .prev('.omit').hide()
      .prev('.hide').fadeIn();
  return false;
});
});
