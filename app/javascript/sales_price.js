function sales_price(){
  let tax = 0.1;
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemPriceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price")
    const addTaxPriceValue = Math.floor(itemPriceValue * tax);
    const profit = document.getElementById("profit");
    const profitValue = Math.floor(itemPriceValue - addTaxPriceValue);
    addTaxPrice.innerHTML = addTaxPriceValue.toLocaleString('ja-JP');
    profit.innerHTML = profitValue.toLocaleString('ja-JP');
  });
}

window.addEventListener('load', sales_price);