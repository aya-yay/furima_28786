window.addEventListener('load', function(){
    const itemPrice = document.getElementById("item-price")
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    itemPrice.addEventListener ('keyup', function(){
      const itemPriceId = itemPrice.value;
      const addTaxPriceId = itemPriceId / 10
      const profitCalc = itemPriceId - addTaxPriceId 
      addTaxPrice.innerHTML = addTaxPriceId
      profit.innerHTML = profitCalc
    })
})