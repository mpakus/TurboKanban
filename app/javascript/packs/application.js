import '../styles/application.css'

require("@rails/ujs").start()

// import "channels"
// import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
// import { Turbo, cable } from "@hotwired/turbo-rails"
require("channels")

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
