import '../styles/application.css';

import "@hotwired/turbo-rails";
// require("@rails/ujs").start();
import Rails from '@rails/ujs';
Rails.start();
require("channels");
import 'controllers';


// import "channels"
// import Rails from "@rails/ujs"
// import { Turbo, cable } from "@hotwired/turbo-rails"

// import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"
//
// const application = Application.start()
// const context = require.context("../controllers", true, /\.js$/)
// application.load(definitionsFromContext(context))

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
