import iro from "@jaames/iro";

function setupColorPicker() {
  const colorPickerEl = document.querySelector("#color-picker");

  if (!colorPickerEl) {
    return;
  }

  if (colorPickerEl.innerHTML === "") {
    const accentColorValueEl = document.querySelector("#accent-color-value");
    const inputEl = document.querySelector("#color-picker ~ div > input");
    const inputErrorEl = document.querySelector("#color-picker ~ div > p");
    inputErrorEl.style = "margin-top: var(--xs)";

    const colorPicker = new iro.ColorPicker(colorPickerEl, {
      color: accentColorValueEl.value,
      width: 200,
    });

    colorPicker.on("color:change", (color) => {
      const newValue = color.hexString;
      accentColorValueEl.value = newValue;
      inputEl.value = newValue;
    });

    inputEl.addEventListener("input", (event) => {
      const newValue = event.target.value;

      if (/^#([a-fA-F0-9]{6})$/.test(newValue)) {
        inputErrorEl.innerHTML = "";
        accentColorValueEl.value = newValue;
        colorPicker.setColors([newValue]);
      } else {
        inputErrorEl.innerHTML = "Invalid color: format must be `#XXXXXX`";
      }
    });
  }
}

window.addEventListener("turbolinks:load", function () {
  setupColorPicker();
});
