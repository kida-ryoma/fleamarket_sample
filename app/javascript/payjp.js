$(function() {
  $('#cardCreateForm').on('submit', function(e) { 
    // ボタンを押した時に発火するイベント
    e.preventDefault()
    Payjp.setPublicKey('pk_test_cf241efe47cd23679b76022d')
    // 公開鍵をセット
    var card = {
      number: document.getElementById("card-number").value,
      exp_month: document.getElementById("credit_exp_month").value,
      exp_year: document.getElementById("credit_exp_year").value,
      cvc: document.getElementById("cvc").value
      // クレジットカードに必要な情報を取り出しcardの変数に代入
    };
    if (card.number == "" || card.cvc == "") {
      alert("入力もれがあります");
      $(".creditCardBtn").prop('disabled', false);
      // もし記載漏れがあればここで処理は終了する
    } else {
      Payjp.createToken(card, function(status, response) {
        if (status === 200 ) {
          // 200とは処理が正常であるということをpayjpが用意してくれているレスポンス
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          // セキュリティの観点からそれぞれの情報を消している
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
            // 目には見えない形で、トークンをフォームに送っている
          );
          $('#cardCreateForm').get(0).submit();
          alert("登録に成功しました");
        } else {
          alert("カード情報が正しくありません");
          $('.creditCardBtn').prop("disabled", false);
        }
      });
    }
  });
});