document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // フォームが存在しないページでは何もしない

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);

    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);
      const profit = price - fee;

      document.getElementById("add-tax-price").textContent = fee;
      document.getElementById("profit").textContent = profit;
    } else {
      document.getElementById("add-tax-price").textContent = '';
      document.getElementById("profit").textContent = '';
    }
  });
});