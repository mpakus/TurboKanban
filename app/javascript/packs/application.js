import '../styles/application.css'

require("@rails/ujs").start()

// import "channels"
// import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
// import { Turbo, cable } from "@hotwired/turbo-rails"
require("channels")


import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

// import "controllers"

// window.Turbo = Turbo;
// window.cable = cable;

// Rails.start()
// Turbo.start();
// Turbo.setProgressBarDelay(500);
//
// window.Turbo = Turbo;
// window.cable = cable;

// Turbo.start()
//
// (function() {
//   this.App || (this.App = {});
//
//   App.cable = ActionCable.createConsumer(`ws://localhost:28080`);
// }).call(this);
