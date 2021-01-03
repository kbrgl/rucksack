import iro from "@jaames/iro";

function setupColorPicker() {
  const colorPickerEl = document.querySelector("#color-picker");

  if (colorPickerEl.innerHTML === "") {
    const accentColorValueEl = document.querySelector("#accent-color-value");

    const colorPicker = new iro.ColorPicker(colorPickerEl, {
      color: accentColorValueEl.value,
      width: 200,
    });

    colorPicker.on("color:change", (color) => {
      accentColorValueEl.value = color.hexString;
    });
  }
}

function setupSettingsForms() {
  const settingsItems = document.querySelectorAll("form");
}

window.addEventListener("turbolinks:load", function () {
  setupSettingsForms();
  setupColorPicker();
});
