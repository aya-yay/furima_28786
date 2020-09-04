window.addEventListener("DOMContentLoaded", () => {
const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);  // PAY.JPテスト公開鍵~
 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("purchase_item[number]"),
      cvc: formData.get("purchase_item[cvc]"),
      exp_month: formData.get("purchase_item[exp_month]"),
      exp_year: `20${formData.get("purchase_item[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert("カード情報が正しく読み込まれませんでした。ページを読み込んでから、もう一度入力してください。");
      }
    });
  });
});
window.addEventListener("load", pay);