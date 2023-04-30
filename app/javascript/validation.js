// const validation = () => {
//   //半角数字でないものにマッチする正規表現を変数化
//   const pricePattern = /^[\A\d+\z]/;
//   //エラーメッセージを表示する要素を変数化
//   const priceErrorMessage = document.getElementById("price-error");
//   //フォームの値が入る要素を変数化
//   const itemPrice = document.getElementById("item-price");

//   //キーボード操作がされた時にイベント発火
//   addEventListener("keyup", e => {
//     if (pricePattern.test(itemPrice.value) || itemPrice.value == "") {
//       //item-priceが半角数字か空白ならエラーメッセージは表示しない
//       priceErrorMessage.style.visibility="hidden";
//     }else {
//       //item-priceが全角数字ならエラーメッセージを表示する
//       priceErrorMessage.style.visibility="visible";
//     }
//   })
// }

// window.addEventListener("load", validation)