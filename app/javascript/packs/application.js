// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "trix";
import "@rails/actiontext";
import "chartkick";
import "chart.js";
import "dashboard";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.addEventListener("turbolinks:load", function () {
  const expandButton = document.querySelector(".l-navbar__expand");
  const links = document.querySelector(".l-navbar__links");
  expandButton.addEventListener("click", () => {
    links.classList.toggle("is-active");
  });

  document.querySelectorAll('a[href="#"]').forEach((item) => {
    item.addEventListener("click", (event) => event.preventDefault());
  });
});
