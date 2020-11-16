import axios from "axios"

// Make Rails .xhr? and respond_to methods happy
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"

export default axios
