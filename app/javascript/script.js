let title = "javascript使える"

alert(title);

$('document').ready(function(){
  $('.jquery').on('click', function (){
    $(this).css('color','red');
  });
});

const opt = {
  loop: true,
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
}

$(document).on('turbolinks:load', function(){
  let swiper = new Swiper('.swiper', opt);
});