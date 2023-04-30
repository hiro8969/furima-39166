window.addEventListener('load', function(){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price');
    const profitDom = document.getElementById('profit');
    let tax = 0;
    let profit = 0;

    // 価格の範囲をチェックする
    if (inputValue === "" || isNaN(inputValue)) {
      addTaxDom.innerHTML = "-";
      profitDom.innerHTML = "-";
    } else if (inputValue < 300) {
      addTaxDom.innerHTML = "-";
      profitDom.innerHTML = "-";
      // alert("価格は300円以上で入力してください。");
    } else if (inputValue > 9999999) {
      addTaxDom.innerHTML = "-";
      profitDom.innerHTML = "-";
      // alert("価格は9,999,999円以下で入力してください。");
    } else {
      tax = Math.floor(parseInt(inputValue) * 0.1);
      profit = Math.floor(parseInt(inputValue) - tax);
      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    }
  })
})





