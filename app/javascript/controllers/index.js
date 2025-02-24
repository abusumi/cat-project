// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import AutocompleteController from "./autocomplete_controller"
application.register("autocomplete", AutocompleteController)

