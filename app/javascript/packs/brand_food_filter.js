document.addEventListener("turbo:load", () => {
  // メインフードのメーカーとフード
  const mainBrandSelect = document.getElementById("main_brand_select");
  const mainFoodSelect = document.getElementById("main_food_select");

  if (mainBrandSelect && mainFoodSelect) {
    mainBrandSelect.addEventListener("change", (event) => {
      const brandId = event.target.value;
      mainFoodSelect.innerHTML = "<option value=''>フードを選択</option>";
      if (brandId) {
        fetch(`/brands/${brandId}/foods`)
          .then((response) => response.json())
          .then((foods) => {
            foods.forEach((food) => {
              const option = document.createElement("option");
              option.value = food.id;
              option.textContent = food.name;
              mainFoodSelect.appendChild(option);
            });
          })
          .catch((error) => {
            console.error("Error fetching foods:", error);
          });
      }
    });
  }

  // サブフードのメーカーとフード
  const subBrandSelect = document.getElementById("sub_brand_select");
  const subFoodSelect = document.getElementById("sub_food_select");

  if (subBrandSelect && subFoodSelect) {
    subBrandSelect.addEventListener("change", (event) => {
      const brandId = event.target.value;
      subFoodSelect.innerHTML = "<option value=''>フードを選択</option>";
      if (brandId) {
        fetch(`/brands/${brandId}/foods`)
          .then((response) => response.json())
          .then((foods) => {
            foods.forEach((food) => {
              const option = document.createElement("option");
              option.value = food.id;
              option.textContent = food.name;
              subFoodSelect.appendChild(option);
            });
          })
          .catch((error) => {
            console.error("Error fetching foods:", error);
          });
      }
    });
  }
});
