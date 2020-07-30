$(function(){
  function buildHTML(review){
    if(review.image.url !== null) {
                  var html =  
                  `<div class="review-container__box__content__title">
                    ${review.title}
                  </div>
                  <div class="review-container__box__content__box">
                  <div class="reviewer">
                    ${review.user_nickname} : 
                  </div>
                  <div class="create-at">
                    ${review.created_at}
                  </div>
                </div>
                <div class="review-container__box__content__content">
                  ${review.content}
                </div>
                <div class="review-container__box__content__image">
                  <img src= "${review.image.url}">
                </div>`
                } else {
                  var html =
                  `<div class="review-container__box__content__title">
                  ${review.title}
                </div>
                <div class="review-container__box__content__box">
                  <div class="reviewer">
                    ${review.user_nickname} : 
                  </div>
                  <div class="create-at">
                    ${review.created_at}
                  </div>
                </div>
                <div class="review-container__box__content__content">
                  ${review.content}
                </div>`
                }
    return html;
  }

  var ReviewValid = {
  rules: {
    "review[title]": {
      required: true,
    },
    "review[content]": {
      required: true,
    },
  },
  messages: {
    "review[title]": {
      required: 'レビュータイトルを入力してください',
    },
    "review[content]": {
      required: 'レビューを入力してください',
    },
  }}
  

  $('#new-review').on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $(this).validate(ReviewValid);
    if (!$(this).valid()) {
      return false;
    };
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.review-container__box__content').prepend(html);
      $('#review-title').val('');
      $('#review-content').val('');
      $('#review-image').val('');
      $('#new-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});

