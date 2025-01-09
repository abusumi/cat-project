document.addEventListener("turbo:load", () => {
  const brandSelect = document.getElementById("brand_select");
  const foodSelect = document.getElementById("food_select");

  if (brandSelect && foodSelect) {
    brandSelect.addEventListener("change", (event) => {
      const brandId = event.target.value;

      // プルダウンをリセットして「フードを選択」を追加
      foodSelect.innerHTML = "<option value=''>フードを選択</option>";

      if (brandId) {
        fetch(`/brands/${brandId}/foods`)
          .then((response) => response.json())
          .then((foods) => {
            // フードのオプションを追加
            foods.forEach((food) => {
              const option = document.createElement("option");
              option.value = food.id;
              option.textContent = food.name;
              foodSelect.appendChild(option);
            });
          })
          .catch((error) => {
            console.error("Error fetching foods:", error);
          });
      }
    });
  }
});
