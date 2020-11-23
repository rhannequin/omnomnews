import axios from "axios"

import { HEADER_KEY, TOKEN } from "../utils/csrf"

// Make Rails .xhr? and respond_to methods happy
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"

// CSRF
axios.defaults.headers.common[HEADER_KEY] = TOKEN

export default axios
