document.addEventListener('turbo:load', () => {
  const price = () => {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 入力フォームがない場合は何もしない
    if (!priceInput || !addTaxDom || !profitDom) return;

    // 金額入力の度にイベント発火
    priceInput.addEventListener("input", () => {
      const price = parseInt(priceInput.value);

      // 有効な金額の場合のみ計算処理を実行
      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);
        const profit = price - fee;

        // 計算結果をそれぞれ表示
        addTaxDom.innerHTML = fee;
        profitDom.innerHTML = profit;
      } else {
        // 入力が不正な場合、表示をクリア
        addTaxDom.innerHTML = '';
        profitDom.innerHTML = '';
      }
    });
  };

  // ページ読み込み時とTurboによる再描画時に価格計算を適用
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);
});